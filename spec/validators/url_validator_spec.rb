class UrlDummyModel
  include ActiveModel::Model
  attr_accessor :url

  validates :url, url: true
end

class UrlDummyModelWithDomain
  include ActiveModel::Model
  attr_accessor :url

  validates :url, url: {domain: "example.com"}
end

class UrlDummyModelWithStartsWith
  include ActiveModel::Model
  attr_accessor :url

  validates :url, url: { start_with: "https://" }
end

RSpec.describe UrlValidator do
  context "when value is nil" do
    it "is valid" do
      model = UrlDummyModel.new(url: nil)
      expect(model).to be_valid
    end
  end

  context "when value is blank" do
    it "is valid" do
      model = UrlDummyModel.new(url: "")
      expect(model).to be_valid
    end
  end

  context "when url is valid" do
    it "is valid" do
      model = UrlDummyModel.new(url: "https://example.com")
      expect(model).to be_valid
    end
  end

  context "when url is invalid" do
    it "adds invalid_url error" do
      model = UrlDummyModel.new(url: "not-a-url")
      expect(model).not_to be_valid
      expect(model.errors[:url]).to include(I18n.t("errors.messages.invalid_url"))
    end
  end

  context "when domain option is set" do
    it "is valid when domain matches" do
      model = UrlDummyModelWithDomain.new(url: "https://example.com/path")
      expect(model).to be_valid
    end

    it "adds domain error when domain does not match" do
      model = UrlDummyModelWithDomain.new(url: "https://google.com")
      expect(model).not_to be_valid
      expect(model.errors[:url]).to include(
        I18n.t("errors.messages.domain", domain: "example.com")
      )
    end
  end

  context "when start_with option is set" do
    it "is valid when prefix matches" do
      model = UrlDummyModelWithStartsWith.new(url: "https://example.com")
      expect(model).to be_valid
    end

    it "adds start_with error when prefix does not match" do
      model = UrlDummyModelWithStartsWith.new(url: "http://example.com")
      expect(model).not_to be_valid
      expect(model.errors[:url]).to include(
        I18n.t("errors.messages.start_with", start: "https://")
      )
    end
  end

  context "when multiple options fail" do
    it "adds multiple errors" do
      model = UrlDummyModelWithDomain.new(url: "http://google.com")
      expect(model).not_to be_valid
      expect(model.errors[:url].size).to be >= 1
    end
  end
end
