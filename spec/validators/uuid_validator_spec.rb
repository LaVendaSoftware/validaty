class UUIDDummyModel
  include ActiveModel::Model
  attr_accessor :pid

  validates :pid, uuid: true
end

RSpec.describe UUIDValidator do
  subject(:model) { UUIDDummyModel.new(pid:) }

  context "when pid is nil" do
    let(:pid) { nil }

    it "is valid" do
      expect(model).to be_valid
    end
  end

  context "when pid is blank" do
    let(:pid) { "" }

    it "is valid" do
      expect(model).to be_valid
    end
  end

  context "when pid is a valid uuid" do
    let(:pid) { "550e8400-e29b-41d4-a716-446655440000" }

    it "is valid" do
      expect(model).to be_valid
    end
  end

  context "when pid is invalid" do
    let(:pid) { "123-invalid-uuid" }

    it "is invalid" do
      expect(model).not_to be_valid
      expect(model.errors[:pid]).to include(I18n.t("errors.messages.invalid_uuid"))
    end
  end

  context "when pid has invalid format but correct length" do
    let(:pid) { "550e8400e29b41d4a716446655440000" }

    it "is invalid" do
      expect(model).not_to be_valid
    end
  end
end
