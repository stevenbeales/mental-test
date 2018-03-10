# -*- encoding: utf-8 -*-
# stub: adamantium 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "adamantium".freeze
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Dan Kubb".freeze, "Markus Schirp".freeze]
  s.date = "2014-01-21"
  s.description = "Immutable extensions to objects".freeze
  s.email = ["dan.kubb@gmail.com".freeze, "mbj@seonic.net".freeze]
  s.extra_rdoc_files = ["LICENSE".freeze, "README.md".freeze, "CONTRIBUTING.md".freeze, "TODO".freeze]
  s.files = ["CONTRIBUTING.md".freeze, "LICENSE".freeze, "README.md".freeze, "TODO".freeze]
  s.homepage = "https://github.com/dkubb/adamantium".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.14".freeze
  s.summary = "Immutable extensions to objects".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ice_nine>.freeze, ["~> 0.11.0"])
      s.add_runtime_dependency(%q<memoizable>.freeze, ["~> 0.4.0"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 1.5.2", "~> 1.5"])
    else
      s.add_dependency(%q<ice_nine>.freeze, ["~> 0.11.0"])
      s.add_dependency(%q<memoizable>.freeze, ["~> 0.4.0"])
      s.add_dependency(%q<bundler>.freeze, [">= 1.5.2", "~> 1.5"])
    end
  else
    s.add_dependency(%q<ice_nine>.freeze, ["~> 0.11.0"])
    s.add_dependency(%q<memoizable>.freeze, ["~> 0.4.0"])
    s.add_dependency(%q<bundler>.freeze, [">= 1.5.2", "~> 1.5"])
  end
end
