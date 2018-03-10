# -*- encoding: utf-8 -*-
# stub: abstract_type 0.0.7 ruby lib

Gem::Specification.new do |s|
  s.name = "abstract_type".freeze
  s.version = "0.0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Dan Kubb".freeze]
  s.date = "2013-10-28"
  s.description = "Module to declare abstract classes and methods".freeze
  s.email = ["dan.kubb@gmail.com".freeze]
  s.extra_rdoc_files = ["LICENSE".freeze, "README.md".freeze, "CONTRIBUTING.md".freeze, "TODO".freeze]
  s.files = ["CONTRIBUTING.md".freeze, "LICENSE".freeze, "README.md".freeze, "TODO".freeze]
  s.homepage = "https://github.com/dkubb/abstract_type".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.14".freeze
  s.summary = "Module to declare abstract classes and methods".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, [">= 1.3.5", "~> 1.3"])
    else
      s.add_dependency(%q<bundler>.freeze, [">= 1.3.5", "~> 1.3"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, [">= 1.3.5", "~> 1.3"])
  end
end
