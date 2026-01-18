require "active_model"

module Validaty
  class Base < ActiveModel::EachValidator
    def validate_each(resource, attribute, value)
      resource, attribute, value = prepare_params(resource, attribute, value)

      return if valid_value?(value)

      resource.errors.add(attribute, options[:message] || default_message_error)
    end

    private

    def prepare_params(resource, attribute, value)
      [resource, attribute, value]
    end

    def valid_value?(value)
      raise NotImplementedError, "You must implement 'valid_value?(value)' method"
    end

    def default_message_error
      raise NotImplementedError, "You must implement 'default_message_error' method"
    end
  end
end
