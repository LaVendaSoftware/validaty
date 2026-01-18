class WordCountDummyModel
  include ActiveModel::Model

  attr_accessor :name

  validates :name, word_count: {min: 2, max: 4}
end

RSpec.describe WordCountValidator do
  subject(:model) { WordCountDummyModel.new(name:) }

  context "when name is nil" do
    let(:name) { nil }

    it "is valid" do
      expect(model).to be_valid
    end
  end

  context "when name has fewer words than min" do
    let(:name) { "one" }

    it "is invalid" do
      expect(model).not_to be_valid
      expect(model.errors[:name]).to include("must have at least 2 words")
    end
  end

  context "when name has more words than max" do
    let(:name) { "one two three four five" }

    it "is invalid" do
      expect(model).not_to be_valid
      expect(model.errors[:name]).to include("must have at most 4 words")
    end
  end

  context "when name is within limits" do
    let(:name) { "one two three" }

    it { expect(model).to be_valid }
  end
end
