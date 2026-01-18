require "phone"

class PhoneValidator < Validaty::AllowBlankBase
  DEFAULT_COUNTRY_CALLING_CODE = "55"

  private

  def valid_value?(value)
    Phoner::Phone.valid?(value)
  end

  def prepare_params(resource, attribute, value)
    country_calling_code =
    resource
      .send(options[:country_calling_code])
      .to_s
      .gsub(/[^0-9]/, "")
      .presence || DEFAULT_COUNTRY_CALLING_CODE

    value = ["+", country_calling_code, value.to_s.gsub(/[^0-9]/, "")].join

    [resource, attribute, value]
  end

  def default_message_error
    :invalid_phone
  end
end
