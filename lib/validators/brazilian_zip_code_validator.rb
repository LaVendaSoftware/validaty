class BrazilianZipCodeValidator < Validaty::AllowBlankBase
  ZIP_CODE_REGEX = /\A\d{5}-?\d{3}\z/

  private

  def valid_value?(value)
    ActiveSupport::Deprecation
      .new("0.0.7", "Validaty")
      .warn("`brazilian_zip_code` is deprecated. Use `brazilian_postal_code` instead.")

    super
  end

  def default_message_error
    :invalid_zip_code
  end
end
