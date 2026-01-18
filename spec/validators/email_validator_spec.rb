class EmailDummyModel
  include ActiveModel::Model
  attr_accessor :email

  validates :email, email: true
end

RSpec.describe EmailValidator do
  subject(:model) { EmailDummyModel.new(email:) }

  context "when email is nil" do
    let(:email) { nil }

    it "is valid" do
      expect(model).to be_valid
    end
  end

  context "when email is blank" do
    let(:email) { "" }

    it "is valid" do
      expect(model).to be_valid
    end
  end

  context "when email is valid" do
    let(:email) { "user@example.com" }

    it "is valid" do
      expect(model).to be_valid
    end
  end

  context "when email has subdomain" do
    let(:email) { "user@mail.example.com" }

    it "is valid" do
      expect(model).to be_valid
    end
  end

  context "when email is invalid" do
    let(:email) { "invalid-email" }

    it "is invalid" do
      expect(model).not_to be_valid
      expect(model.errors[:email]).to include(
        I18n.t("errors.messages.invalid_email")
      )
    end
  end

  context "when email is missing domain" do
    let(:email) { "user@" }

    it "is invalid" do
      expect(model).not_to be_valid
    end
  end
end
