class BrazilianZipCodeValidator < BrazilianPostalCodeValidator
  private

  def valid_value?(value)
    ActiveSupport::Deprecation
      .new("0.0.7", "Validaty")
      .warn("`brazilian_zip_code` is deprecated. Use `brazilian_postal_code` instead.")

    super
  end
end
