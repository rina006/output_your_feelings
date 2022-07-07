require "rails_helper"

RSpec.describe ContactMailer, type: :mailer do
  describe "contact_us_email" do
    let(:mail) { ContactMailer.contact_us_email }

    it "renders the headers" do
      expect(mail.subject).to eq("Contact us email")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
