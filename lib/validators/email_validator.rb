require "uri"

class EmailValidator < Validaty::AllowBlankBase
  private

  def valid_value?(value)
    value.match?(URI::MailTo::EMAIL_REGEXP)
  end

  def default_message_error
    :invalid_email
  end
end
