# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "minter"
  spec.version = "0.0.3"
  spec.authors = ["Alexander Nikolaev"]

  spec.summary       = "This is a Ruby SDK based on Golang SDK for working with Minter blockchain"
  spec.description   = "This is a Ruby SDK based on Golang SDK for working with Minter blockchain"
  spec.homepage      = "https://github.com/rubyroid-team/minter"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/rubyroid-team/minter"
  spec.metadata["changelog_uri"] = "https://github.com/rubyroid-team/minter/blob/master/CHANGELOG.md"

  spec.files         = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md", "{lib}/ffi/**.*"]

  spec.require_paths = ["lib"]

  spec.add_dependency "dotenv"
  spec.add_dependency "ffi"
  spec.add_dependency "http"
  spec.add_dependency "json"
  spec.add_dependency "rake"
  spec.add_dependency "rspec"
end
