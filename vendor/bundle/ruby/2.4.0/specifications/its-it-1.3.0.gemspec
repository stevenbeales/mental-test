# -*- encoding: utf-8 -*-
# stub: its-it 1.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "its-it".freeze
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.7".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ronen Barzel".freeze]
  s.date = "2011-04-26"
  s.description = "\nThis gem defines the Kernel method \"it\" that queue and defer method calls.\nThis extends the Symbol#to_proc idiom to support chaining multiple methods.\nFor example, items.collect(&it.to_s.capitalize).  This also allows\nconditionals in case statements, such as: case ... when it > 3 then [etc.].\nThe method is also aliased as \"its\", for methods that describe possessives\nrather than actions, such as items.collect(&its.name.capitalize)\n\n[This gem is an extension of Jay Philips' \"methodphitamine\" gem, updated\nfor ruby 1.9 and gemspec compatibility and adding the case statement functionality.]\n".freeze
  s.email = "ronen@barzel.org".freeze
  s.extra_rdoc_files = ["LICENSE.txt".freeze]
  s.files = ["LICENSE.txt".freeze]
  s.homepage = "http://github.com/ronen/its-it".freeze
  s.rubygems_version = "2.6.14".freeze
  s.summary = "Defines its() and it() method-chain proxies.".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rdoc>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov-gem-adapter>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rdoc>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov-gem-adapter>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rdoc>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov-gem-adapter>.freeze, [">= 0"])
  end
end
