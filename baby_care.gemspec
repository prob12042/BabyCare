lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "baby_care/version"

Gem::Specification.new do |spec|
  spec.name          = "baby_care"
  spec.version       = BabyCare::VERSION
  spec.authors       = ["prob12402"]
  spec.email         = ["a.gaysenko@gmail.com"]

  spec.summary       = %q{Displays a list of Baby Care Centers from Yelp API.}
  spec.description   = %q{CLI program that allows user to navigate through the YELP API finding a Baby care center.}
  spec.homepage      = "https://github.com/prob12042/BabyCare"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  spec.metadata["allowed_push_host"] = "http://mygemserver.com"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/prob12042/BabyCare"
  spec.metadata["changelog_uri"] = "https://github.com/prob12042/BabyCare/changelog.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  #spec.bindir        = "exe"
  spec.executables   = ["baby_list"]
  spec.require_paths = ["lib"]

  spec.add_dependency "artii"
  spec.add_dependency "http"
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "pry"
end
