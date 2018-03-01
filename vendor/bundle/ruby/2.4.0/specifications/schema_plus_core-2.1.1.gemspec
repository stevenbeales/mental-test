# -*- encoding: utf-8 -*-
# stub: schema_plus_core 2.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "schema_plus_core".freeze
  s.version = "2.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["ronen barzel".freeze]
  s.date = "2017-07-31"
  s.description = "Provides an internal extension API to ActiveRecord, in the form of middleware-style callback stacks".freeze
  s.email = ["ronen@barzel.org".freeze]
  s.homepage = "https://github.com/SchemaPlus/schema_plus_core".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.14".freeze
  s.summary = "Provides an internal extension API to ActiveRecord".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>.freeze, ["~> 5.0"])
      s.add_runtime_dependency(%q<schema_monkey>.freeze, ["~> 2.1"])
      s.add_runtime_dependency(%q<its-it>.freeze, ["~> 1.2"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0.0"])
      s.add_development_dependency(%q<rspec-given>.freeze, [">= 0"])
      s.add_development_dependency(%q<schema_dev>.freeze, ["~> 3.7"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov-gem-profile>.freeze, [">= 0"])
      s.add_development_dependency(%q<its-it>.freeze, [">= 0"])
    else
      s.add_dependency(%q<activerecord>.freeze, ["~> 5.0"])
      s.add_dependency(%q<schema_monkey>.freeze, ["~> 2.1"])
      s.add_dependency(%q<its-it>.freeze, ["~> 1.2"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0.0"])
      s.add_dependency(%q<rspec-given>.freeze, [">= 0"])
      s.add_dependency(%q<schema_dev>.freeze, ["~> 3.7"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov-gem-profile>.freeze, [">= 0"])
      s.add_dependency(%q<its-it>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>.freeze, ["~> 5.0"])
    s.add_dependency(%q<schema_monkey>.freeze, ["~> 2.1"])
    s.add_dependency(%q<its-it>.freeze, ["~> 1.2"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0.0"])
    s.add_dependency(%q<rspec-given>.freeze, [">= 0"])
    s.add_dependency(%q<schema_dev>.freeze, ["~> 3.7"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov-gem-profile>.freeze, [">= 0"])
    s.add_dependency(%q<its-it>.freeze, [">= 0"])
  end
end
