class BooleanValidator < Validaty::Base
  private

  def valid_value?(value)
    [true, false].include?(value)
  end

  def default_message_error
    :boolean
  end
end
