class CPFDummyModel
  include ActiveModel::Model

  attr_accessor :cpf

  validates :cpf, cpf: true
end

RSpec.describe CPFValidator do
  subject(:model) { CPFDummyModel.new(cpf:) }

  context "when cpf is nil" do
    let(:cpf) { nil }

    it "is valid" do
      expect(model).to be_valid
    end
  end

  context "when cpf is blank" do
    let(:cpf) { "" }

    it "is valid" do
      expect(model).to be_valid
    end
  end

  context "when cpf is valid" do
    let(:cpf) { "39053344705" }

    it "is valid" do
      expect(model).to be_valid
    end
  end

  context "when cpf has formatting characters" do
    let(:cpf) { "390.533.447-05" }

    it "is valid" do
      expect(model).to be_valid
    end
  end

  context "when cpf is invalid" do
    let(:cpf) { "12345678900" }

    it "is invalid" do
      expect(model).not_to be_valid
      expect(model.errors[:cpf]).to include(
        I18n.t("errors.messages.invalid_cpf")
      )
    end
  end
end
