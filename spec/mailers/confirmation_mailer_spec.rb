# frozen_string_literal: true

require "spec_helper"

describe ConfirmationMailer do
  context "alert" do
    let(:object) { mock_model(Alert, confirm_id: "a237bfc", email: "matthew@oaf.org.au") }

    context "default theme" do
      let(:notifier) { ConfirmationMailer.confirm(object) }

      describe "confirm" do
        it "should come from the planningalerts' normal email" do
          expect(notifier.from).to eq(["contact@planningalerts.org.au"])
        end

        it "should go to the alert's email address" do
          expect(notifier.to).to eq(["matthew@oaf.org.au"])
        end

        it "should tell the person what the email is about" do
          expect(notifier.subject).to eq("PlanningAlerts: Please confirm your alert")
        end

        it do
          expect(notifier.body.parts.find { |p| p.content_type.match(/plain/) }.body.raw_source).to eq(Rails.root.join("spec/mailers/regression/email_confirmable/alert.txt").read.gsub("\n", "\r\n"))
        end

        it do
          expect(notifier.body.parts.find { |p| p.content_type.match(/html/) }.body.raw_source).to eq(Rails.root.join("spec/mailers/regression/email_confirmable/alert.html").read.gsub("\n", "\r\n"))
        end
      end
    end
  end

  context "comment" do
    let(:authority) { mock_model(Authority) }
    let(:application) do
      mock_model(Application,
                 authority: authority, address: "10 Smith Street",
                 description: "A building", council_reference: "27B/6")
    end
    let(:object) do
      mock_model(Comment, text: "This is a comment",
                          confirm_id: "sdbfjsd3rs",
                          email: "matthew@openaustralia.org",
                          application: application,
                          recipient_display_name: nil)
    end

    context "default theme" do
      let(:notifier) { ConfirmationMailer.confirm(object) }

      describe "confirm" do
        it "should come from the planningalerts' normal email" do
          expect(notifier.from).to eq(["contact@planningalerts.org.au"])
        end

        it "should go to the comment's email address" do
          expect(notifier.to).to eq(["matthew@openaustralia.org"])
        end

        it "should tell the person what the email is about" do
          expect(notifier.subject).to eq("PlanningAlerts: Please confirm your comment")
        end

        it do
          expect(notifier.body.parts.find { |p| p.content_type.match(/plain/) }.body.raw_source).to eq(Rails.root.join("spec/mailers/regression/email_confirmable/comment.txt").read.gsub("\n", "\r\n"))
        end

        it do
          expect(notifier.body.parts.find { |p| p.content_type.match(/html/) }.body.raw_source).to eq(Rails.root.join("spec/mailers/regression/email_confirmable/comment.html").read.gsub("\n", "\r\n"))
        end
      end
    end
  end
end
