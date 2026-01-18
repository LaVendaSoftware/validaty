require "cpf_cnpj"

class CPFValidator < Validaty::AllowBlankBase
  private

  def valid_value?(value)
    CPF.valid?(value)
  end

  def default_message_error
    :invalid_cpf
  end
end
