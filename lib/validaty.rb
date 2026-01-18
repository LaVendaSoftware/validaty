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
require_relative "validators/word_count_validator"

module Validaty
  I18n.load_path += Dir[File.join(__dir__, "validaty/locales/*.yml")]

  class Error < StandardError; end
end

CpfValidator = CPFValidator unless defined?(CpfValidator)
CnpjValidator = CNPJValidator unless defined?(CnpjValidator)
