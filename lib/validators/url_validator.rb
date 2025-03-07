require "uri"

class UrlValidator < Validaty::AllowBlankBase
  def validate_each(resource, attribute, value)
    super
    return if options[:starts_with].blank?
    return if value.starts_with?(options[:starts_with])

    resource.errors.add(attribute, :starts_with, start: options[:starts_with])
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
