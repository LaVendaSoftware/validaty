class PhoneDummyModel
  include ActiveModel::Model

  attr_accessor :phone, :country_code

  validates :phone, phone: {country_calling_code: :country_code}
end

RSpec.describe PhoneValidator do
  subject(:model) { PhoneDummyModel.new(phone:, country_code:) }

  context "when value is nil" do
    let(:phone) { nil }
    let(:country_code) { "55" }

    it { expect(model).to be_valid }
  end

  context "when value is blank" do
    let(:phone) { "" }
    let(:country_code) { "55" }

    it { expect(model).to be_valid }
  end

  context "when phone is valid" do
    let(:phone) { "11999998888" }
    let(:country_code) { "55" }

    it { expect(model).to be_valid }
  end

  context "when phone has formatting characters" do
    let(:phone) { "(11) 99999-8888" }
    let(:country_code) { "+55" }

    it { expect(model).to be_valid }
  end

  context "when phone is invalid" do
    let(:phone) { "123" }
    let(:country_code) { "55" }

    it "adds invalid_phone error" do
      expect(model).not_to be_valid
      expect(model.errors[:phone]).to include(I18n.t("errors.messages.invalid_phone"))
    end
  end

  context "when country_code attribute is missing" do
    let(:phone) { "11999998888" }
    let(:country_code) { nil }

    it { expect(model).to be_valid }
  end
end
