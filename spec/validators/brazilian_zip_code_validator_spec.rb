class DummyModel
  include ActiveModel::Model

  attr_accessor :zip_code

  validates :zip_code, brazilian_zip_code: true
end

RSpec.describe BrazilianZipCodeValidator do
  subject(:model) { DummyModel.new(zip_code: zip_code) }

  context "when zip_code is nil" do
    let(:zip_code) { nil }

    it { expect(model).to be_valid }
  end

  context "when zip_code is blank" do
    let(:zip_code) { "" }

    it { expect(model).to be_valid }
  end

  context "when zip code is valid" do
    let(:zip_code) { "12345-678" }

    it { expect(model).to be_valid }
  end

  context "when zip code is valid without dash" do
    let(:zip_code) { "12345678" }

    it { expect(model).to be_valid }
  end

  context "when zip code has invalid format" do
    let(:zip_code) { "1234-5678" }

    it "is invalid" do
      expect(model).not_to be_valid
      expect(model.errors[:zip_code]).to include(
        I18n.t("errors.messages.invalid_zip_code")
      )
    end
  end

  context "when zip code contains letters" do
    let(:zip_code) { "12A45-678" }

    it { expect(model).not_to be_valid }
  end
end
