# -*- encoding: utf-8 -*-
# stub: schema_monkey 2.1.5 ruby lib

Gem::Specification.new do |s|
  s.name = "schema_monkey".freeze
  s.version = "2.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["ronen barzel".freeze]
  s.date = "2016-06-24"
  s.description = "Provides a module insertion protocol to facilitate adding features to ActiveRecord".freeze
  s.email = ["ronen@barzel.org".freeze]
  s.homepage = "https://github.com/SchemaPlus/schema_monkey".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1.0".freeze)
  s.rubygems_version = "2.6.14".freeze
  s.summary = "Provides a module insertion protocol to facilitate adding features to ActiveRecord".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>.freeze, [">= 4.2"])
      s.add_runtime_dependency(%q<modware>.freeze, ["~> 0.1"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<rspec-given>.freeze, ["~> 3.6"])
      s.add_development_dependency(%q<its-it>.freeze, [">= 0"])
      s.add_development_dependency(%q<schema_dev>.freeze, ["~> 3.7"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov-gem-profile>.freeze, [">= 0"])
    else
      s.add_dependency(%q<activerecord>.freeze, [">= 4.2"])
      s.add_dependency(%q<modware>.freeze, ["~> 0.1"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<rspec-given>.freeze, ["~> 3.6"])
      s.add_dependency(%q<its-it>.freeze, [">= 0"])
      s.add_dependency(%q<schema_dev>.freeze, ["~> 3.7"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov-gem-profile>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>.freeze, [">= 4.2"])
    s.add_dependency(%q<modware>.freeze, ["~> 0.1"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rspec-given>.freeze, ["~> 3.6"])
    s.add_dependency(%q<its-it>.freeze, [">= 0"])
    s.add_dependency(%q<schema_dev>.freeze, ["~> 3.7"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov-gem-profile>.freeze, [">= 0"])
  end
end
