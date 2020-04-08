Gem::Specification.new do |spec|
  spec.name = "minter"
  spec.version = "0.0.1"
  spec.authors = ["Alexander Nikolaev"]

  spec.summary       = %q{This is a pure Ruby SDK for working with Minter blockchain}
  spec.description   = %q{This is a pure Ruby SDK for working with Minter blockchain}
  spec.homepage      = "https://github.com/MinterTeam/minter-ruby-sdk"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/nikolaev-dev/minter-ruby-sdk"
  spec.metadata["changelog_uri"] = "https://github.com/MinterTeam/nikolaev-dev/blob/master/CHANGELOG.md"

  spec.files         = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md"]

  spec.require_paths = ["lib"]
end