class BrazilianZipCodeValidator < Validaty::AllowBlankBase
  ZIP_CODE_REGEX = /\A\d{5}-?\d{3}\z/

  private

  def valid_value?(value)
    value.match?(ZIP_CODE_REGEX)
  end

  def default_message_error
    :invalid_zip_code
  end
end
