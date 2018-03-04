# -*- encoding: utf-8 -*-
# stub: acts-as-taggable-array-on 0.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "acts-as-taggable-array-on".freeze
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Takuya Miyamoto".freeze]
  s.date = "2017-05-24"
  s.description = "Simple tagging gem for Rails using postgres array.".freeze
  s.email = ["miyamototakuya@gmail.com".freeze]
  s.homepage = "https://github.com/tmiyamon/acts-as-taggable-array-on".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.14".freeze
  s.summary = "Simple tagging gem for Rails using postgres array.".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>.freeze, [">= 4"])
      s.add_runtime_dependency(%q<activesupport>.freeze, [">= 4"])
      s.add_development_dependency(%q<pg>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.5"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>.freeze, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<listen>.freeze, ["~> 3.0.0"])
    else
      s.add_dependency(%q<activerecord>.freeze, [">= 4"])
      s.add_dependency(%q<activesupport>.freeze, [">= 4"])
      s.add_dependency(%q<pg>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.5"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec-rails>.freeze, [">= 0"])
      s.add_dependency(%q<guard-rspec>.freeze, [">= 0"])
      s.add_dependency(%q<listen>.freeze, ["~> 3.0.0"])
    end
  else
    s.add_dependency(%q<activerecord>.freeze, [">= 4"])
    s.add_dependency(%q<activesupport>.freeze, [">= 4"])
    s.add_dependency(%q<pg>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.5"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec-rails>.freeze, [">= 0"])
    s.add_dependency(%q<guard-rspec>.freeze, [">= 0"])
    s.add_dependency(%q<listen>.freeze, ["~> 3.0.0"])
  end
end
