# -*- encoding: utf-8 -*-
# stub: cane 2.6.2 ruby lib

Gem::Specification.new do |s|
  s.name = "cane".freeze
  s.version = "2.6.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Xavier Shay".freeze]
  s.date = "2014-04-21"
  s.description = "Fails your build if code quality thresholds are not met".freeze
  s.email = ["xavier@squareup.com".freeze]
  s.executables = ["cane".freeze]
  s.files = ["bin/cane".freeze]
  s.homepage = "http://github.com/square/cane".freeze
  s.licenses = ["Apache 2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.0".freeze)
  s.rubygems_version = "2.6.14".freeze
  s.summary = "Fails your build if code quality thresholds are not met. Provides complexity and style checkers built-in, and allows integration with with custom quality metrics.".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<parallel>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 2.0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec-fire>.freeze, [">= 0"])
    else
      s.add_dependency(%q<parallel>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 2.0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<rspec-fire>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<parallel>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<rspec-fire>.freeze, [">= 0"])
  end
end
