# -*- encoding: utf-8 -*-
# stub: jsonb_accessor 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "jsonb_accessor".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Michael Crismali".freeze, "Joe Hirn".freeze, "Jason Haruska".freeze]
  s.bindir = "exe".freeze
  s.date = "2017-08-26"
  s.description = "Adds typed jsonb backed fields to your ActiveRecord models.".freeze
  s.email = ["michael@crismali.com".freeze, "joe@devmynd.com".freeze, "jason@haruska.com".freeze]
  s.homepage = "https://github.com/devmynd/jsonb_accessor".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new("~> 2.0".freeze)
  s.rubygems_version = "2.6.14".freeze
  s.summary = "Adds typed jsonb backed fields to your ActiveRecord models.".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>.freeze, [">= 5.0"])
      s.add_runtime_dependency(%q<activesupport>.freeze, [">= 5.0"])
      s.add_runtime_dependency(%q<pg>.freeze, [">= 0.18.1"])
      s.add_development_dependency(%q<appraisal>.freeze, ["~> 2.2.0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.15.0"])
      s.add_development_dependency(%q<database_cleaner>.freeze, ["~> 1.6.0"])
      s.add_development_dependency(%q<awesome_print>.freeze, [">= 0"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
      s.add_development_dependency(%q<pry-doc>.freeze, [">= 0"])
      s.add_development_dependency(%q<pry-nav>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.6.0"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.48.1"])
      s.add_development_dependency(%q<standalone_migrations>.freeze, ["~> 5.2.0"])
    else
      s.add_dependency(%q<activerecord>.freeze, [">= 5.0"])
      s.add_dependency(%q<activesupport>.freeze, [">= 5.0"])
      s.add_dependency(%q<pg>.freeze, [">= 0.18.1"])
      s.add_dependency(%q<appraisal>.freeze, ["~> 2.2.0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.15.0"])
      s.add_dependency(%q<database_cleaner>.freeze, ["~> 1.6.0"])
      s.add_dependency(%q<awesome_print>.freeze, [">= 0"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
      s.add_dependency(%q<pry-doc>.freeze, [">= 0"])
      s.add_dependency(%q<pry-nav>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.6.0"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.48.1"])
      s.add_dependency(%q<standalone_migrations>.freeze, ["~> 5.2.0"])
    end
  else
    s.add_dependency(%q<activerecord>.freeze, [">= 5.0"])
    s.add_dependency(%q<activesupport>.freeze, [">= 5.0"])
    s.add_dependency(%q<pg>.freeze, [">= 0.18.1"])
    s.add_dependency(%q<appraisal>.freeze, ["~> 2.2.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.15.0"])
    s.add_dependency(%q<database_cleaner>.freeze, ["~> 1.6.0"])
    s.add_dependency(%q<awesome_print>.freeze, [">= 0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<pry-doc>.freeze, [">= 0"])
    s.add_dependency(%q<pry-nav>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.6.0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.48.1"])
    s.add_dependency(%q<standalone_migrations>.freeze, ["~> 5.2.0"])
  end
end
