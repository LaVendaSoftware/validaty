require "uri"

class UrlValidator < Validaty::AllowBlankBase
  def validate_each(resource, attribute, value)
    if options[:domain].present? && URI.parse(value).host != options[:domain]
      resource.errors.add(attribute, :domain, domain: options[:domain])
    end

    start = options[:start_with].presence || options[:starts_with]

    if start.present? && !value.to_s.start_with?(start)
      resource.errors.add(attribute, :start_with, start:)
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
    :invalid_url
  end
end
