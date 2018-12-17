# frozen_string_literal: true

require "spec_helper"

describe Alert do
  it_behaves_like "email_confirmable"

  let(:address) { "24 Bruce Road, Glenbrook" }

  # TODO: is there a way to test this that isn't repeating #attach_alert_subscriber ?
  #       Note that this is actually testing that the association is persisted,
  #       which #attach_alert_subscriber doesn't do currently.
  describe "before_create" do
    context "when it's the first alert with this email" do
      it "creates an associated AlertSubscriber for them" do
        alert = create(:alert, email: "eliza@example.org")

        expect(alert.alert_subscriber.email).to eql "eliza@example.org"
      end
    end

    context "when there is an existing alert" do
      let!(:first_alert) { create(:alert, email: "eliza@example.org") }

      context "with a different email" do
        let(:second_alert) { create(:alert, email: "kush@example.net") }

        it "they are assigned different alert subscribers" do
          expect(first_alert.alert_subscriber).to_not eq second_alert.alert_subscriber
        end
      end

      context "with the same email" do
        let(:second_alert) { create(:alert, email: "eliza@example.org") }

        it "they are assigned the same alert subscriber" do
          expect(first_alert.alert_subscriber).to eq second_alert.alert_subscriber
        end
      end
    end

    context "when there is a pre-existing AlertSubscriber with their email" do
      let!(:subscriber) do
        create(
          :alert_subscriber,
          email: "eliza@example.org"
        )
      end

      it "is assigned as it's AlertSubscriber" do
        alert = create(:alert, email: "eliza@example.org")

        expect(alert.alert_subscriber).to eql subscriber
      end
    end
  end

  context "when the geocoder doesn't need to run" do
    let(:alert) { build(:alert, address: "foo", lat: 1, lng: 2) }

    it "doesn't validate the address" do
      expect(alert).to be_valid
    end
  end

  context "when the geocoder does need to run" do
    let(:alert) do
      build(:alert, address: "Bruce Rd", lat: nil, lng: nil)
    end

    it "is valid when the geocoder returns no errors" do
      mock_geocoder_valid_address_response

      expect(alert).to be_valid
    end

    it "is invalid if there was an error geocoding the address" do
      mock_geocoder_error_response

      alert.save

      expect(alert).to be_invalid
      expect(alert.errors[:address]).to eq(["some error message"])
    end

    it "is invalid if the geocoder found multiple locations for the address" do
      mock_geocoder_multiple_locations_response

      alert.save

      expect(alert).not_to be_valid
      expect(alert.errors[:address]).to eq(["isn't complete. Please enter a full street address, including suburb and state, e.g. Bruce Rd, VIC 3885"])
    end
  end

  it "should be able to accept location information if it is already known and so not use the geocoder" do
    expect(Location).not_to receive(:geocode)

    alert = create(:alert, lat: 1.0, lng: 2.0)

    expect(alert.lat).to eq(1.0)
    expect(alert.lng).to eq(2.0)
  end

  describe "geocoding" do
    it "should happen automatically on saving" do
      alert = build(:alert, address: address, lat: nil, lng: nil)

      VCR.use_cassette(:planningalerts) { alert.save! }

      expect(alert.lat).to eq(-33.7726179)
      expect(alert.lng).to eq(150.6242341)
    end

    it "should replace the address with the full resolved address obtained by geocoding" do
      alert = build(:alert, address: "24 Bruce Road, Glenbrook", lat: nil, lng: nil)

      VCR.use_cassette(:planningalerts) { alert.save! }

      expect(alert.address).to eq("24 Bruce Rd, Glenbrook NSW 2773")
    end
  end

  it "should be able to store the attribute location" do
    alert = Alert.new
    alert.location = Location.new(1.0, 2.0)
    expect(alert.lat).to eq(1.0)
    expect(alert.lng).to eq(2.0)
    expect(alert.location.lat).to eq(1.0)
    expect(alert.location.lng).to eq(2.0)
  end

  it "should handle location being nil" do
    alert = Alert.new
    alert.location = nil
    expect(alert.lat).to be_nil
    expect(alert.lng).to be_nil
    expect(alert.location).to be_nil
  end

  describe "radius_meters" do
    it "should have a number" do
      alert = build(:alert, radius_meters: "a")
      expect(alert).not_to be_valid
      expect(alert.errors[:radius_meters]).to eq(["isn't selected"])
    end

    it "should be greater than zero" do
      alert = build(:alert, radius_meters: "0")
      expect(alert).not_to be_valid
      expect(alert.errors[:radius_meters]).to eq(["isn't selected"])
    end
  end

  describe "confirmed" do
    it "should be false when alert is created" do
      expect(create(:alert).confirmed).to be false
    end

    it "should be able to be set to false" do
      alert = build(:alert)
      alert.confirmed = false
      alert.save!
      expect(alert.confirmed).to eq(false)
    end

    it "should be able to set to true" do
      alert = build(:alert)
      alert.confirmed = true
      alert.save!
      expect(alert.confirmed).to eq(true)
    end
  end

  describe "#geocode_from_address" do
    let(:original_address) { "24 Bruce Road, Glenbrook" }

    it "sets the address to the full address returned from the geocoder" do
      mock_geocoder_valid_address_response
      alert = build(:alert, address: original_address, lat: nil, lng: nil)

      alert.geocode_from_address

      expect(alert.address).to eq "24 Bruce Rd, Glenbrook, VIC 3885"
    end

    it "sets the lat and lng" do
      mock_geocoder_valid_address_response
      alert = build(:alert, address: original_address, lat: nil, lng: nil)

      alert.geocode_from_address

      expect(alert.lat).to eq(-33.772607)
      expect(alert.lng).to eq(150.624245)
    end

    context "when there is an error geocoding" do
      it "doesn't update any values" do
        mock_geocoder_error_response

        alert = build(:alert, address: original_address, lat: nil, lng: nil)

        alert.geocode_from_address

        expect(alert.address).to eq original_address
        expect(alert.location).to eq nil
      end
    end

    context "when the geocoder finds multiple locations" do
      it "doesn't update any values" do
        mock_geocoder_multiple_locations_response
        alert = build(:alert, address: original_address, lat: nil, lng: nil)

        alert.geocode_from_address

        expect(alert.address).to eq original_address
        expect(alert.location).to eq nil
      end
    end
  end

  describe "#geocoded?" do
    it { expect(build(:alert, address: "foo", lat: nil, lng: nil).geocoded?).to be false }
    it { expect(build(:alert, address: "foo", lat: 1, lng: 2).geocoded?).to be true }
  end

  describe "#unsubscribe!" do
    let(:alert) { create :alert }

    it "unsubscribes the alert" do
      alert.unsubscribe!

      expect(alert).to be_unsubscribed
    end

    it "sets the unsubscribed_at time" do
      action_time = Time.utc(2016, 11, 3, 15, 29)

      Timecop.freeze(action_time) { alert.unsubscribe! }

      expect(alert.unsubscribed_at).to eql action_time
    end
  end

  describe "recent applications for this user" do
    before :each do
      @alert = create(:alert, email: "matthew@openaustralia.org", address: address, radius_meters: 2000)
      # Position test application around the point of the alert
      p1 = @alert.location.endpoint(0, 501) # 501 m north of alert
      p2 = @alert.location.endpoint(0, 499) # 499 m north of alert
      p3 = @alert.location.endpoint(45, 499 * Math.sqrt(2)) # Just inside the NE corner of a box centred on the alert (of size 2 * 499m)
      p4 = @alert.location.endpoint(90, 499) # 499 m east of alert
      auth = create(:authority)
      @app1 = create(:application, lat: p1.lat, lng: p1.lng, date_scraped: 5.minutes.ago, council_reference: "A1", suburb: "", state: "", postcode: "", authority: auth)
      @app2 = create(:application, lat: p2.lat, lng: p2.lng, date_scraped: 12.hours.ago, council_reference: "A2", suburb: "", state: "", postcode: "", authority: auth)
      @app3 = create(:application, lat: p3.lat, lng: p3.lng, date_scraped: 2.days.ago, council_reference: "A3", suburb: "", state: "", postcode: "", authority: auth)
      @app4 = create(:application, lat: p4.lat, lng: p4.lng, date_scraped: 4.days.ago, council_reference: "A4", suburb: "", state: "", postcode: "", authority: auth)
    end

    it "should return applications that have been scraped since the last time the user was sent an alert" do
      @alert.last_sent = 3.days.ago
      @alert.radius_meters = 2000
      @alert.save!

      expect(@alert.recent_applications.size).to eq 3
      expect(@alert.recent_applications).to include(@app1)
      expect(@alert.recent_applications).to include(@app2)
      expect(@alert.recent_applications).to include(@app3)
    end

    it "should return applications within the user's search area" do
      @alert.last_sent = 5.days.ago
      @alert.radius_meters = 500
      @alert.save!

      expect(@alert.recent_applications.size).to eq 2
      expect(@alert.recent_applications).to include(@app2)
      expect(@alert.recent_applications).to include(@app4)
    end

    it "should return applications that have been scraped in the last twenty four hours if the user has never had an alert" do
      @alert.last_sent = nil
      @alert.radius_meters = 2000
      @alert.save!

      expect(@alert.recent_applications.size).to eq 2
      expect(@alert.recent_applications).to include(@app1)
      expect(@alert.recent_applications).to include(@app2)
    end
  end

  describe "frequency_distribution" do
    it "should return a frequency distribution of objects as an array sorted by count" do
      expect(Alert.frequency_distribution(%w[a b c a a c a])).to eq([["a", 4], ["c", 2], ["b", 1]])
    end
  end

  describe "#new_comments" do
    let(:alert) { create(:alert, address: address, radius_meters: 2000) }
    let(:p1) { alert.location.endpoint(0, 501) } # 501 m north of alert
    let(:application) { create(:application, lat: p1.lat, lng: p1.lng, suburb: "", state: "", postcode: "") }

    it "sees a new comment when there are new comments on an application" do
      comment1 = create(:confirmed_comment, application: application)

      expect(alert.new_comments).to eql [comment1]
    end

    it "only sees two new comments when there are two new comments on a single application" do
      comment1 = create(:confirmed_comment, application: application)
      comment2 = create(:confirmed_comment, application: application)

      expect(alert.new_comments).to eql [comment1, comment2]
    end

    it "does not see old confirmed comments" do
      old_comment = create(:confirmed_comment,
                           confirmed_at: alert.cutoff_time - 1,
                           application: application)

      expect(alert.new_comments).to_not eql [old_comment]
    end

    it "does not see unconfirmed comments" do
      unconfirmed_comment = create(:unconfirmed_comment, application: application)

      expect(alert.new_comments).to_not eql [unconfirmed_comment]
    end

    it "does not see hidden comments" do
      hidden_comment = create(:confirmed_comment, hidden: true, application: application)

      expect(alert.new_comments).to_not eql [hidden_comment]
    end
  end

  describe "#new_replies" do
    let(:alert) do
      create(:alert,
             address: address,
             radius_meters: 2000,
             lat: 1.0,
             lng: 2.0)
    end

    context "when their are no new replies" do
      it { expect(alert.new_replies).to eq [] }
    end

    it "when there is a new reply on a nearby application it finds a new reply" do
      application = create(:application,
                           lat: 1.0,
                           lng: 2.0,
                           address: address,
                           suburb: "Glenbrook",
                           state: "NSW",
                           postcode: "2773",
                           no_alerted: 3)
      reply = create(:reply,
                     comment: create(:comment, application: application),
                     received_at: 1.hour.ago)

      expect(alert.new_replies).to eq [reply]
    end

    it "only finds two new reply when there are two new replies on a sinlge application" do
      application = create(:application,
                           lat: 1.0,
                           lng: 2.0,
                           address: address,
                           suburb: "Glenbrook",
                           state: "NSW",
                           postcode: "2773",
                           no_alerted: 3)
      reply1 = create(:reply,
                      comment: create(:comment, application: application),
                      received_at: 1.hour.ago)
      reply2 = create(:reply,
                      comment: create(:comment, application: application),
                      received_at: 2.hours.ago)

      expect(alert.new_replies).to eq [reply1, reply2]
    end
  end

  describe "#applications_with_new_comments" do
    let(:alert) { create(:alert, address: address, radius_meters: 2000, lat: 1.0, lng: 2.0) }
    let(:near_application) do
      create(:application,
             lat: 1.0,
             lng: 2.0,
             address: address,
             suburb: "Glenbrook",
             state: "NSW",
             postcode: "2773")
    end
    let(:far_away_application) do
      # 5001 m north of alert
      create(:application,
             lat: alert.location.endpoint(0, 5001).lat,
             lng: alert.location.endpoint(0, 5001).lng,
             address: address,
             suburb: "Glenbrook",
             state: "NSW",
             postcode: "2773")
    end

    context "when there are no new comments near by" do
      it { expect(alert.applications_with_new_comments).to eq [] }
    end

    context "when there is a new comment near by" do
      it "returns the application it belongs to" do
        create(:confirmed_comment, application: near_application)

        expect(alert.applications_with_new_comments).to eq [near_application]
      end
    end

    context "when there is an old comment near by" do
      it "does not return the application it belongs to" do
        create(:confirmed_comment,
               confirmed_at: alert.cutoff_time - 1,
               application: near_application)

        expect(alert.applications_with_new_comments).to eq []
      end
    end

    context "when there is an unconfirmed comment near by" do
      it "does not return the application it belongs to" do
        create(:unconfirmed_comment, application: near_application)

        expect(alert.applications_with_new_comments).to eq []
      end
    end

    context "when there is a hidden comment near by" do
      it "does not return the application it belongs to" do
        create(:confirmed_comment, hidden: true, application: near_application)

        expect(alert.applications_with_new_comments).to eq []
      end
    end

    context "when there is a new comment far away" do
      it "does not return the application it belongs to" do
        create(:confirmed_comment, application: far_away_application)

        expect(alert.applications_with_new_comments).to eq []
      end
    end
  end

  describe "#applications_with_new_replies" do
    let(:alert) do
      create(:alert,
             address: address,
             radius_meters: 2000,
             lat: 1.0,
             lng: 2.0)
    end

    context "when there are no new relies near by" do
      it { expect(alert.applications_with_new_replies).to eq [] }
    end

    context "when there is a new reply near by" do
      it "should return the application it belongs to" do
        application = create(:application,
                             lat: 1.0,
                             lng: 2.0,
                             address: address,
                             suburb: "Glenbrook",
                             state: "NSW",
                             postcode: "2773",
                             no_alerted: 3)
        create(:reply,
               comment: create(:comment, application: application),
               received_at: 1.hour.ago)

        expect(alert.applications_with_new_replies).to eq [application]
      end
    end

    context "when there is a new reply far away" do
      it "should not return the application it belongs to" do
        far_away = alert.location.endpoint(0, 5001) # 5001 m north of alert
        application = create(:application,
                             lat: far_away.lat,
                             lng: far_away.lng,
                             address: address,
                             suburb: "Glenbrook",
                             state: "NSW",
                             postcode: "2773",
                             no_alerted: 3)
        create(:reply,
               comment: create(:comment, application: application),
               received_at: 1.hour.ago)

        expect(alert.applications_with_new_replies).to eq []
      end
    end
  end

  describe "#process!" do
    context "an alert with no new comments" do
      let(:alert) { create(:alert, address: address) }
      before :each do
        allow(alert).to receive(:recent_comments).and_return([])
        # Don't know why this isn't cleared out automatically
        ActionMailer::Base.deliveries = []
      end

      context "and a new application nearby" do
        let(:application) do
          create(:application,
                 lat: 1.0, lng: 2.0, address: "24 Bruce Road, Glenbrook, NSW",
                 suburb: "Glenbrook", state: "NSW", postcode: "2773", no_alerted: 3)
        end

        before :each do
          allow(alert).to receive(:recent_applications).and_return([application])
        end

        it "should return the number of applications, comments and replies sent" do
          expect(alert.process!).to eq([1, 0, 0])
        end

        it "should send an email" do
          alert.process!
          expect(ActionMailer::Base.deliveries.size).to eq(1)
        end

        it "should update the tally" do
          alert.process!
          expect(application.no_alerted).to eq(4)
        end

        it "should update the last_sent time" do
          alert.process!
          expect((alert.last_sent - Time.zone.now).abs).to be < 1
        end

        it "should update the last_processed time" do
          alert.process!
          expect((alert.last_processed - Time.zone.now).abs).to be < 1
        end

        context "that was not properly geocoded" do
          let(:application) do
            VCR.use_cassette("application_with_no_address") do
              create(:application, lat: 1.0, lng: 2.0, address: "An address that can't be geocoded")
            end
          end

          it "should not cause the application to be re-geocoded" do
            expect(Location).to_not receive(:geocode)
            alert.process!
          end
        end
      end

      context "and no new applications nearby" do
        before :each do
          allow(alert).to receive(:recent_applications).and_return([])
        end

        it "should not send an email" do
          alert.process!
          expect(ActionMailer::Base.deliveries).to be_empty
        end

        it "should not update the last_sent time" do
          alert.process!
          expect(alert.last_sent).to be_nil
        end

        it "should update the last_processed time" do
          alert.process!
          expect((alert.last_processed - Time.zone.now).abs).to be < 1
        end
      end

      context "and one new reply nearby" do
        let(:application) do
          create(:application,
                 lat: 1.0,
                 lng: 2.0,
                 address: "24 Bruce Road, Glenbrook, NSW",
                 suburb: "Glenbrook",
                 state: "NSW",
                 postcode: "2773",
                 no_alerted: 3)
        end
        let(:reply) do
          create(:reply, comment: create(:comment, application: application),
                         received_at: 1.hour.ago)
        end

        before :each do
          allow(alert).to receive(:new_replies).and_return([reply])
        end

        it "should return the number of applications, comments and replies sent" do
          expect(alert.process!).to eq([0, 0, 1])
        end

        it "should send an email" do
          alert.process!
          expect(ActionMailer::Base.deliveries.size).to eq(1)
        end
      end
    end
  end

  describe "#attach_alert_subscriber" do
    context "when it's the only alert with this email" do
      it "is creates an associated AlertSubscriber for them" do
        alert = build(:alert, email: "eliza@example.org")

        alert.attach_alert_subscriber

        expect(alert.alert_subscriber.email).to eql "eliza@example.org"
        expect(alert.alert_subscriber).to be_persisted
      end
    end

    context "when there is another alert" do
      let(:first_alert) { build(:alert, email: "eliza@example.org") }

      context "with a different email" do
        let(:second_alert) { build(:alert, email: "kush@example.net") }

        it "they are assigned different alert subscribers" do
          first_alert.attach_alert_subscriber
          second_alert.attach_alert_subscriber

          expect(first_alert.alert_subscriber).to_not eql second_alert.alert_subscriber
          expect(first_alert.alert_subscriber).to be_persisted
          expect(second_alert.alert_subscriber).to be_persisted
        end
      end

      context "with the same email" do
        let(:second_alert) { build(:alert, email: "eliza@example.org") }

        it "they are assigned the same alert subscriber" do
          first_alert.attach_alert_subscriber
          second_alert.attach_alert_subscriber

          expect(first_alert.alert_subscriber).to eql second_alert.alert_subscriber
        end
      end
    end

    context "when there is a pre-existing AlertSubscriber with their email" do
      let!(:subscriber) do
        create(
          :alert_subscriber,
          email: "eliza@example.org"
        )
      end

      it "is is assigned as it's AlertSubscriber" do
        alert = create(:alert, email: "eliza@example.org")

        alert.attach_alert_subscriber

        expect(alert.alert_subscriber).to eql subscriber
      end
    end
  end

  describe ".queue_up_alerts_for_next_day" do
    context "with no active alerts" do
      it "should log some useful messages" do
        logger = double
        expect(logger).to receive(:info).with("Checking 0 active alerts")
        expect(logger).to receive(:info).with("Splitting mailing for the next 24 hours into batches of size 100 roughly every 1440 minutes")
        expect(logger).to receive(:info).with("Mailing jobs for the next 24 hours queued")
        Alert.queue_up_alerts_for_next_day(logger)
      end
    end

    context "with two confirmed alerts" do
      let(:alert1) { create(:confirmed_alert) }
      let(:alert2) { create(:confirmed_alert) }
      before(:each) do
        alert1
        alert2
      end

      it "should log some messages" do
        logger = double
        expect(logger).to receive(:info).with("Checking 2 active alerts")
        expect(logger).to receive(:info).with("Splitting mailing for the next 24 hours into batches of size 1 roughly every 720 minutes")
        expect(logger).to receive(:info).with("Mailing jobs for the next 24 hours queued")
        Alert.queue_up_alerts_for_next_day(logger, 1)
      end

      it "should queue up batches" do
        # Silent logger
        logger = double
        allow(logger).to receive(:info)

        alert = double
        expect(Alert).to receive(:delay).and_return(alert).twice
        expect(alert).to receive(:process_alerts).with([alert1.id])
        expect(alert).to receive(:process_alerts).with([alert2.id])
        Alert.queue_up_alerts_for_next_day(logger, 1)
      end
    end
  end
end
