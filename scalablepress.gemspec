# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scalablepress/version'

Gem::Specification.new do |spec|
  spec.name          = "scalablepress"
  spec.version       = Scalablepress::VERSION
  spec.authors       = ["oren mazor"]
  spec.email         = ["oren.mazor@gmail.com"]
  spec.summary       = %q{quick and dirty wrapper for the scalable press api}
  spec.description   = %q{quick and dirty wrapper for the scalable press api}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "rest-client"
end
