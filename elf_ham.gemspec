# frozen_string_literal: true

require_relative "lib/elf_ham/version"

Gem::Specification.new do |spec|
  spec.name          = "elf_ham"
  spec.version       = ElfHam::VERSION
  spec.authors       = ["Jared Norman"]
  spec.email         = ["jared@super.gd"]

  spec.summary       = "A simple helper for writing scripts to transform CSV files"
  spec.description   = "A simple helper for writing scripts to transform CSV files"
  spec.homepage      = "https://github.com/jarednorman/elf_ham"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "git@github.com:jarednorman/elf_ham.git"
  spec.metadata["changelog_uri"] = "https://github.com/jarednorman/elf_ham/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.executables   = []
  spec.require_paths = ["lib"]
end
