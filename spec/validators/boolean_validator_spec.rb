class BooleanDummyModel
  include ActiveModel::Model

  attr_accessor :accepted

  validates :accepted, boolean: true
end

RSpec.describe BooleanValidator do
  subject(:model) { BooleanDummyModel.new(accepted:) }

  context "when accepted is true" do
    let(:accepted) { true }

    it "is valid" do
      expect(model).to be_valid
    end
  end

  context "when accepted is false" do
    let(:accepted) { false }

    it "is valid" do
      expect(model).to be_valid
    end
  end

  context "when accepted is nil" do
    let(:accepted) { nil }

    it "is invalid" do
      expect(model).not_to be_valid
      expect(model.errors[:accepted]).to include(
        I18n.t("errors.messages.boolean")
      )
    end
  end

  context "when accepted is string" do
    let(:accepted) { "true" }

    it "is invalid" do
      expect(model).not_to be_valid
    end
  end

  context "when accepted is integer" do
    let(:accepted) { 1 }

    it "is invalid" do
      expect(model).not_to be_valid
    end
  end
end
