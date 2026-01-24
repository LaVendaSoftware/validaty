class DummyModel
  include ActiveModel::Model

  attr_accessor :postal_code

  validates :postal_code, brazilian_zip_code: true
end

RSpec.describe BrazilianZipCodeValidator do
  subject(:model) { DummyModel.new(postal_code:) }

  let(:postal_code) { "12345-678" }

  it "emits a deprecation warning" do
    expect {
      model.valid?
    }.to output(/`brazilian_zip_code` is deprecated/).to_stderr
  end
end
