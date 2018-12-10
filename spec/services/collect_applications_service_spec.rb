# frozen_string_literal: true

require "spec_helper"

describe CollectApplicationsService do
  before :each do
    Authority.delete_all
    @auth = create(:authority, full_name: "Fiddlesticks", state: "NSW", short_name: "Fiddle")
    # Stub out the geocoder to return some arbitrary coordinates so that the tests can run quickly
    allow(Location).to receive(:geocode).and_return(
      double(lat: 1.0, lng: 2.0, suburb: "Glenbrook", state: "NSW",
             postcode: "2773", success: true)
    )
  end

  describe "collecting applications from the scraperwiki web service url" do
    it "should translate the data" do
      feed_data = <<-JSON
        [
          {
            "date_scraped": "2012-08-24",
            "description": "Construction of Dwelling",
            "info_url": "http://www.yarracity.vic.gov.au/Planning-Application-Search/Results.aspx?ApplicationNumber=PL01/0776.01&Suburb=(All)&Street=(All)&Status=(All)&Ward=(All)",
            "on_notice_from": "2012-05-01",
            "on_notice_to": "2012-06-01",
            "date_received": "2012-07-06",
            "council_reference": "PL01/0776.01",
            "address": "56 Murphy St Richmond VIC 3121",
            "comment_url": "http://www.yarracity.vic.gov.au/planning--building/Planning-applications/Objecting-to-a-planning-applicationVCAT/"
          },
          {
            "date_scraped": "2012-08-24",
            "description": "Liquor Licence for Existing Caf\u00e9",
            "info_url": "http://www.yarracity.vic.gov.au/Planning-Application-Search/Results.aspx?ApplicationNumber=PL02/0313.01&Suburb=(All)&Street=(All)&Status=(All)&Ward=(All)",
            "date_received": "2012-07-30",
            "council_reference": "PL02/0313.01",
            "address": "359-361 Napier St Fitzroy VIC 3065",
            "comment_url": "http://www.yarracity.vic.gov.au/planning--building/Planning-applications/Objecting-to-a-planning-applicationVCAT/"
          }
        ]
      JSON
      # Freeze time
      t = Time.zone.now
      allow(Time).to receive(:now).and_return(t)
      expect(CollectApplicationsService.translate_morph_feed_data(feed_data, Logger.new(STDOUT))).to eq(
        [
          {
            date_scraped: t,
            description: "Construction of Dwelling",
            info_url: "http://www.yarracity.vic.gov.au/Planning-Application-Search/Results.aspx?ApplicationNumber=PL01/0776.01&Suburb=(All)&Street=(All)&Status=(All)&Ward=(All)",
            on_notice_from: "2012-05-01",
            on_notice_to: "2012-06-01",
            date_received: "2012-07-06",
            council_reference: "PL01/0776.01",
            address: "56 Murphy St Richmond VIC 3121",
            comment_url: "http://www.yarracity.vic.gov.au/planning--building/Planning-applications/Objecting-to-a-planning-applicationVCAT/"
          },
          {
            date_scraped: t,
            description: "Liquor Licence for Existing Caf\u00e9",
            info_url: "http://www.yarracity.vic.gov.au/Planning-Application-Search/Results.aspx?ApplicationNumber=PL02/0313.01&Suburb=(All)&Street=(All)&Status=(All)&Ward=(All)",
            on_notice_from: nil,
            on_notice_to: nil,
            date_received: "2012-07-30",
            council_reference: "PL02/0313.01",
            address: "359-361 Napier St Fitzroy VIC 3065",
            comment_url: "http://www.yarracity.vic.gov.au/planning--building/Planning-applications/Objecting-to-a-planning-applicationVCAT/"
          }
        ]
      )
    end

    it "should handle a malformed response" do
      expect(CollectApplicationsService.translate_morph_feed_data('[["An invalid scraperwiki API response"]]', Logger.new(File::NULL))).to eq([])
    end
  end

  describe "collecting applications from the scraper web service urls" do
    before :each do
      @feed_xml = <<-JSON
      [
        {
          "council_reference": "R1",
          "address": "1 Smith Street, Fiddleville",
          "description": "Knocking a house down",
          "info_url": "http://fiddle.gov.au/info/R1",
          "comment_url": "http://fiddle.gov.au/comment/R1",
          "date_received": "2009-01-01",
          "on_notice_from": "2009-01-05",
          "on_notice_to": "2009-01-19"
        },
        {
          "council_reference": "R2",
          "address": "2 Smith Street, Fiddleville",
          "description": "Putting a house up",
          "info_url": "http://fiddle.gov.au/info/R2",
          "comment_url": "http://fiddle.gov.au/comment/R2"
        }
      ]
      JSON
      @date = Date.new(2009, 1, 1)
      @feed_url = "http://example.org?year=#{@date.year}&month=#{@date.month}&day=#{@date.day}"
      Application.delete_all
      allow(CollectApplicationsService).to receive(:open_url_safe).and_return(@feed_xml)
    end

    it "should collect the correct applications" do
      logger = double
      expect(logger).to receive(:info).with("2 new applications found for Fiddlesticks, NSW with date from 2009-01-01 to 2009-01-01")
      CollectApplicationsService.collect_applications_date_range(@auth, @date, @date, logger)
      expect(Application.count).to eq(2)
      r1 = Application.find_by(council_reference: "R1")
      expect(r1.authority).to eq(@auth)
      expect(r1.address).to eq("1 Smith Street, Fiddleville")
      expect(r1.description).to eq("Knocking a house down")
      expect(r1.info_url).to eq("http://fiddle.gov.au/info/R1")
      expect(r1.comment_url).to eq("http://fiddle.gov.au/comment/R1")
      expect(r1.date_received).to eq(@date)
      expect(r1.on_notice_from).to eq(Date.new(2009, 1, 5))
      expect(r1.on_notice_to).to eq(Date.new(2009, 1, 19))
    end

    it "should not create new applications when they already exist" do
      logger = double
      expect(logger).to receive(:info).with("2 new applications found for Fiddlesticks, NSW with date from 2009-01-01 to 2009-01-01")
      expect(logger).to receive(:info).with("0 new applications found for Fiddlesticks, NSW with date from 2009-01-01 to 2009-01-01")

      # Getting the feed twice with the same content
      CollectApplicationsService.collect_applications_date_range(@auth, @date, @date, logger)
      CollectApplicationsService.collect_applications_date_range(@auth, @date, @date, logger)
      expect(Application.count).to eq(2)
    end
  end
end