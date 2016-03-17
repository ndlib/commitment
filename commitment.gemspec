# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'commitment/version'

Gem::Specification.new do |spec|
  spec.name          = "commitment"
  spec.version       = Commitment::VERSION
  spec.authors       = ["Jeremy Friesen"]
  spec.email         = ["jeremy.n.friesen@gmail.com"]

  spec.summary       = %q{Provides a mechanism for monitoring your enduring commitment.}
  spec.description   = %q{Provides a mechanism for monitoring your enduring commitment.}
  spec.homepage      = "https://github.com/ndlib/commitment"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.license       = 'APACHE2'

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "rubocop"
  spec.add_dependency "railties"
  spec.add_dependency "brakeman"
  spec.add_dependency "scss-lint"
  spec.add_dependency "simplecov"
  spec.add_dependency "jshintrb"
  spec.add_dependency "codeclimate-test-reporter"
  spec.add_dependency "fasterer"
end
