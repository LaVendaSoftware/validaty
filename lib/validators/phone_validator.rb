require "phone"

class PhoneValidator < Validaty::AllowBlankBase
  private

  def valid_value?(value)
    Phoner::Phone.valid?(value)
  end

  def prepare_params(resource, attribute, value)
    country_code = resource.send(options[:country_code]).to_s.gsub(/[^0-9]/, "")

    value = ["+", country_code, value.to_s.gsub(/[^0-9]/, "")].join

    [resource, attribute, value]
  end

  def default_message_error
    :invalid
  end
end
