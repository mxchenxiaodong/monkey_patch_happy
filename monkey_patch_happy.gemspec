# coding: utf-8
# lib = File.expand_path('../lib', __FILE__)
# $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
# require 'monkey_patch_happy/version'

Gem::Specification.new do |spec|
  spec.name          = "monkey_patch_happy"
  spec.version       = MonkeyPatchHappy::VERSION
  spec.authors       = ["xdchen"]
  spec.email         = ["xdchen@xtremeprog.com"]
  spec.summary       = %q{some extends for ruby on rails}
  spec.description   = %q{for hash, array, string and so on }
  spec.homepage      = "http://rubygems.org/gems/monkey_patch_happy"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency 'activesupport',"4.0.0.beta1"
end
