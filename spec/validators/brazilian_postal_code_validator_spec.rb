class DummyModel
  include ActiveModel::Model

  attr_accessor :postal_code

  validates :postal_code, brazilian_postal_code: true
end

RSpec.describe BrazilianPostalCodeValidator do
  subject(:model) { DummyModel.new(postal_code:) }

  context "when postal_code is nil" do
    let(:postal_code) { nil }

    it { expect(model).to be_valid }
  end

  context "when postal_code is blank" do
    let(:postal_code) { "" }

    it { expect(model).to be_valid }
  end

  context "when zip code is valid" do
    let(:postal_code) { "12345-678" }

    it { expect(model).to be_valid }
  end

  context "when zip code is valid without dash" do
    let(:postal_code) { "12345678" }

    it { expect(model).to be_valid }
  end

  context "when zip code has invalid format" do
    let(:postal_code) { "1234-5678" }

    it "is invalid" do
      expect(model).not_to be_valid
      expect(model.errors[:postal_code]).to include(
        I18n.t("errors.messages.invalid_postal_code")
      )
    end
  end

  context "when zip code contains letters" do
    let(:postal_code) { "12A45-678" }

    it { expect(model).not_to be_valid }
  end
end
