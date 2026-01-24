class BrazilianPostalCodeValidator < Validaty::AllowBlankBase
  POSTAL_CODE_REGEX = /\A\d{5}-?\d{3}\z/

  private

  def valid_value?(value)
    value.match?(POSTAL_CODE_REGEX)
  end

  def default_message_error
    :invalid_postal_code
  end
end
