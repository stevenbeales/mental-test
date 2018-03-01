# -*- encoding: utf-8 -*-
# stub: modware 0.1.3 ruby lib

Gem::Specification.new do |s|
  s.name = "modware".freeze
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["ronen barzel".freeze]
  s.date = "2016-06-24"
  s.email = ["ronen@barzel.org".freeze]
  s.homepage = "https://github.com/ronen/modware".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1.0".freeze)
  s.rubygems_version = "2.6.14".freeze
  s.summary = "A middleware library, featuring a simple interface and \"callback\" style semantics in the middleware stack".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<key_struct>.freeze, ["~> 0.4"])
      s.add_development_dependency(%q<coveralls>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<rspec-given>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov-gem-profile>.freeze, [">= 0"])
      s.add_development_dependency(%q<its-it>.freeze, [">= 0"])
    else
      s.add_dependency(%q<key_struct>.freeze, ["~> 0.4"])
      s.add_dependency(%q<coveralls>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<rspec-given>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov-gem-profile>.freeze, [">= 0"])
      s.add_dependency(%q<its-it>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<key_struct>.freeze, ["~> 0.4"])
    s.add_dependency(%q<coveralls>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rspec-given>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov-gem-profile>.freeze, [">= 0"])
    s.add_dependency(%q<its-it>.freeze, [">= 0"])
  end
end
