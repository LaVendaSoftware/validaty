module Validaty
  class AllowBlankBase < Base
    def validate_each(resource, attribute, value)
      return if value.blank?

      super
    end
  end
end
