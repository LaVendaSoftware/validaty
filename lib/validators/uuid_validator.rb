class UUIDValidator < Validaty::AllowBlankBase
  UUID_REGEX = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/

  private

  def valid_value?(value)
    value.match?(UUID_REGEX)
  end

  def default_message_error
    :invalid
  end
end
