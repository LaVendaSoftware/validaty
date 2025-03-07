require_relative "validaty/version"
require_relative "validaty/base"
require_relative "validaty/allow_blank_base"

require_relative "validators/boolean_validator"
require_relative "validators/cnpj_validator"
require_relative "validators/cpf_validator"
require_relative "validators/date_validator"
require_relative "validators/email_validator"
require_relative "validators/phone_validator"
require_relative "validators/url_validator"
require_relative "validators/uuid_validator"

module Validaty
  class Error < StandardError; end
end
