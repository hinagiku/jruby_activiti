# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jruby_activiti/version'

Gem::Specification.new do |spec|
  spec.name          = "jruby_activiti"
  spec.version       = JrubyActiviti::VERSION
  # spec.platform      = "java"
  spec.authors       = ["richfisher"]
  spec.email         = ["richfisher.pan@gmail.com"]
  spec.summary       = "Integrate Activiti BPM in JRuby/Rails, including Activiti Engine, Modeler and Diagram Viewer. https://github.com/richfisher/jruby_activiti"
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/richfisher/jruby_activiti"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "minitest", '~> 5.8'

  spec.add_dependency "jbundler"
  spec.add_dependency "sinatra"
end
