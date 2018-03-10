# -*- encoding: utf-8 -*-
# stub: ralyxa 1.6.2 ruby lib

Gem::Specification.new do |s|
  s.name = "ralyxa".freeze
  s.version = "1.6.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Sam Morgan".freeze]
  s.bindir = "exe".freeze
  s.date = "2018-01-10"
  s.description = "A Ruby framework for interacting with Amazon Alexa. Designed to work with Sinatra, although can be used with a few other web frameworks.".freeze
  s.email = ["samm@makersacademy.com".freeze]
  s.homepage = "https://github.com/sjmog/ralyxa".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.1".freeze)
  s.rubygems_version = "2.6.14".freeze
  s.summary = "A Ruby framework for interacting with Amazon Alexa.".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<alexa_verifier>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.14"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<timecop>.freeze, ["~> 0.9"])
      s.add_development_dependency(%q<vcr>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<webmock>.freeze, ["~> 3.0"])
    else
      s.add_dependency(%q<alexa_verifier>.freeze, ["~> 1.0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.14"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<timecop>.freeze, ["~> 0.9"])
      s.add_dependency(%q<vcr>.freeze, ["~> 3.0"])
      s.add_dependency(%q<webmock>.freeze, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<alexa_verifier>.freeze, ["~> 1.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.14"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<timecop>.freeze, ["~> 0.9"])
    s.add_dependency(%q<vcr>.freeze, ["~> 3.0"])
    s.add_dependency(%q<webmock>.freeze, ["~> 3.0"])
  end
end
