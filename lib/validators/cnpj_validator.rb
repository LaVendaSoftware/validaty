require "cpf_cnpj"

class CNPJValidator < Validaty::AllowBlankBase
  private

  def valid_value?(value)
    CNPJ.valid?(value)
  end

  def default_message_error
    :invalid_cnpj
  end
end
