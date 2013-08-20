# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shipping_label/version'

Gem::Specification.new do |spec|
  spec.name          = 'shipping_label'
  spec.version       = ShippingLabel::VERSION
  spec.authors       = ['Derek Prior', 'Paul Smith']
  spec.email         = ['derekprior@gmail.com', 'catalystmediastudios@gmail.com']
  spec.description   = %q{Automaticaly add default URL parameters to links in outbound emails}
  spec.summary       = %q{Automaticaly add default URL parameters to links in outbound emails}
  spec.homepage      = 'https://github.com/T1D/shipping_label'
  spec.license       = 'MIT'

  spec.files         = Dir['{lib,spec}/**/*'] + %w(.gitignore LICENSE.txt README.md Rakefile)
  spec.test_files    = Dir['spec/**/*']
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 1.9.3'
  spec.add_runtime_dependency 'actionmailer', '>= 3.2.0'
  spec.add_runtime_dependency 'activesupport', '>= 3.2.0'
  spec.add_runtime_dependency 'addressable', '>= 2.3.0'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 2.14'
  spec.add_development_dependency 'email_spec', '~> 1.2.0'
  spec.add_development_dependency 'pry-debugger'
end
