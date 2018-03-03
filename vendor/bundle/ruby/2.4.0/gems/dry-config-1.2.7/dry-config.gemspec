# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dry/config/version'

Gem::Specification.new do |s|
  s.name          = 'dry-config'
  s.version       = Dry::Config::VERSION
  s.authors       = ['Kevin Ross']
  s.email         = ['kevin.ross@alienfast.com']
  s.description   = %q{Simple base class for DRY environment based configurations.}
  s.summary       = %q{Simple base class for DRY environment based configurations.}
  s.homepage      = 'https://github.com/alienfast/dry-config'
  s.license       = 'MIT'

  s.files = `git ls-files`.split($/).reject { |f| f =~ /^samples\// }
  s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'

  s.add_dependency 'deep_merge'
end
