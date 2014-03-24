# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'required/version'

Gem::Specification.new do |spec|
  spec.name          = "required"
  spec.version       = Required::VERSION
  spec.authors       = ["krisfox"]
  spec.email         = ["krisfox@gmail.com"]
  spec.description   = %q{This will include the needed javascript for using requirejs and angular}
  spec.summary       = %q{A service to allow lazy loading and one-time loading of needed tools}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  # spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "jeweler"
  spec.add_development_dependency 'jasmine-jquery-rails'
  spec.add_development_dependency 'geminabox'

  spec.add_runtime_dependency "railties",        "~> 3.1"
  spec.add_runtime_dependency "angularjs-rails", ">= 1.0.8"
  spec.add_runtime_dependency "sprockets"
end
