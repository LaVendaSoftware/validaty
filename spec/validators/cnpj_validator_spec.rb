class CNPJDummyModel
  include ActiveModel::Model

  attr_accessor :cnpj

  validates :cnpj, cnpj: true
end

RSpec.describe CNPJValidator do
  subject(:model) { CNPJDummyModel.new(cnpj:) }

  context "when cnpj is nil" do
    let(:cnpj) { nil }

    it "is valid" do
      expect(model).to be_valid
    end
  end

  context "when cnpj is blank" do
    let(:cnpj) { "" }

    it "is valid" do
      expect(model).to be_valid
    end
  end

  context "when cnpj is valid" do
    let(:cnpj) { "11222333000181" } # CNPJ válido

    it "is valid" do
      expect(model).to be_valid
    end
  end

  context "when cnpj has formatting characters" do
    let(:cnpj) { "11.222.333/0001-81" }

    it "is valid" do
      expect(model).to be_valid
    end
  end

  context "when cnpj is invalid" do
    let(:cnpj) { "12345678000100" }

    it "is invalid" do
      expect(model).not_to be_valid
      expect(model.errors[:cnpj]).to include(
        I18n.t("errors.messages.invalid_cnpj")
      )
    end
  end
end
