# frozen_string_literal: true

require_relative "lib/validaty/version"

Gem::Specification.new do |spec|
  spec.name = "validaty"
  spec.version = Validaty::VERSION
  spec.authors = ["Lavenda Software"]
  spec.email = ["lavenda@lavenda.com.br"]

  spec.summary = "Validaty has basic validations for Rails application"
  spec.homepage = "https://github.com/LavendaSoftware/validaty"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "#{spec.homepage}/blob/main/README.md"
  spec.metadata["changelog_uri"] = "#{spec.homepage}/commits/main"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # https://github.com/fnando/cpf_cnpj
  spec.add_dependency "cpf_cnpj"
  # https://github.com/carr/phone#examples
  spec.add_dependency "phone"
end
