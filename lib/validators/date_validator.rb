require "date"

class DateValidator < Validaty::AllowBlankBase
  private

  def valid_value?(value)
    Date.parse(value)
    true
  rescue Date::Error
    false
  end

  def default_message_error
    :invalid_date
  end
end
