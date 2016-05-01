# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'csr_auth/version'

Gem::Specification.new do |spec|
  spec.name          = "csr_auth"
  spec.version       = CsrAuth::VERSION
  spec.authors       = ["nishadmenezes"]
  spec.email         = ["nishadmenezes@gmail.com"]
  spec.summary       = "Allow Cross Origin AJAX requests from trusted web applications to your Rails Back-End."
  spec.description   = ""
  spec.homepage      = "https://github.com/nishadmenezes/csr_auth"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
