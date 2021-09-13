# frozen_string_literal: true

require "spec_helper"

describe ProcessAlertService do
  let(:address) { "24 Bruce Road, Glenbrook" }

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
        allow(alert).to receive(:recent_new_applications).and_return([application])
      end

      it "should return the number of emails, applications and comments sent" do
        expect(ProcessAlertService.call(alert: alert)).to eq([1, 1, 0])
      end

      it "should send an email" do
        ProcessAlertService.call(alert: alert)
        expect(ActionMailer::Base.deliveries.size).to eq(1)
      end

      it "should update the tally" do
        ProcessAlertService.call(alert: alert)
        # Just reload from the database to make sure
        application.reload
        expect(application.no_alerted).to eq(4)
      end

      it "should update the last_sent time" do
        ProcessAlertService.call(alert: alert)
        expect((alert.last_sent - Time.zone.now).abs).to be < 1
      end

      it "should update the last_processed time" do
        ProcessAlertService.call(alert: alert)
        expect((alert.last_processed - Time.zone.now).abs).to be < 1
      end

      context "that was not properly geocoded" do
        let(:application) do
          create(:geocoded_application, lat: 1.0, lng: 2.0, address: "An address that can't be geocoded")
        end

        it "should not cause the application to be re-geocoded" do
          expect(GeocodeService).to_not receive(:call)
          ProcessAlertService.call(alert: alert)
        end
      end
    end

    context "and no new applications nearby" do
      before :each do
        allow(alert).to receive(:recent_new_applications).and_return([])
      end

      it "should not send an email" do
        ProcessAlertService.call(alert: alert)
        expect(ActionMailer::Base.deliveries).to be_empty
      end

      it "should not update the last_sent time" do
        ProcessAlertService.call(alert: alert)
        expect(alert.last_sent).to be_nil
      end

      it "should update the last_processed time" do
        ProcessAlertService.call(alert: alert)
        expect((alert.last_processed - Time.zone.now).abs).to be < 1
      end

      it "should return the number of applications and comments sent" do
        expect(ProcessAlertService.call(alert: alert)).to eq([0, 0, 0])
      end
    end
  end
end
