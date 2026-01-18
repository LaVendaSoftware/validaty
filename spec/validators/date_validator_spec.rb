class DateDummyModel
  include ActiveModel::Model

  attr_accessor :schedule_date

  validates :schedule_date, date: true
end

RSpec.describe DateValidator do
  subject(:model) { DateDummyModel.new(schedule_date:) }

  context "when schedule_date is nil" do
    let(:schedule_date) { nil }

    it "is valid" do
      expect(model).to be_valid
    end
  end

  context "when schedule_date is blank" do
    let(:schedule_date) { "" }

    it "is valid" do
      expect(model).to be_valid
    end
  end

  context "when date is valid (ISO format)" do
    let(:schedule_date) { "2024-01-15" }

    it "is valid" do
      expect(model).to be_valid
    end
  end

  context "when date is valid (BR format)" do
    let(:schedule_date) { "15/01/2024" }

    it "is valid" do
      expect(model).to be_valid
    end
  end

  context "when date is invalid" do
    let(:schedule_date) { "invalid-date" }

    it "is invalid" do
      expect(model).not_to be_valid
      expect(model.errors[:schedule_date]).to include(
        I18n.t("errors.messages.invalid_date")
      )
    end
  end

  context "when date does not exist" do
    let(:schedule_date) { "2024-02-31" }

    it "is invalid" do
      expect(model).not_to be_valid
    end
  end
end
