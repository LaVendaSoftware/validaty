require "uri"

class UrlValidator < Validaty::AllowBlankBase
  def validate_each(resource, attribute, value)
    if options[:domain].present? && URI.parse(value).host != options[:domain]
      resource.errors.add(attribute, :domain, domain: options[:domain])
    end

    if options[:starts_with].present? && !value.to_s.starts_with?(options[:starts_with])
      resource.errors.add(attribute, :starts_with, start: options[:starts_with])
    end

    super
  end

  private

  def valid_value?(url)
    uri = URI.parse(url)
    uri.host.present?
  rescue URI::InvalidURIError
    false
  end

  def default_message_error
    :invalid
  end
end
