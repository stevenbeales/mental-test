# -*- encoding: utf-8 -*-
# stub: concord 0.1.5 ruby lib

Gem::Specification.new do |s|
  s.name = "concord".freeze
  s.version = "0.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Markus Schirp".freeze]
  s.date = "2014-04-20"
  s.description = "Helper for object composition".freeze
  s.email = ["mbj@schirp-dso.com".freeze]
  s.homepage = "https://github.com/mbj/concord".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "2.6.14".freeze
  s.summary = "Helper for object composition".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<adamantium>.freeze, ["~> 0.2.0"])
      s.add_runtime_dependency(%q<equalizer>.freeze, ["~> 0.0.9"])
    else
      s.add_dependency(%q<adamantium>.freeze, ["~> 0.2.0"])
      s.add_dependency(%q<equalizer>.freeze, ["~> 0.0.9"])
    end
  else
    s.add_dependency(%q<adamantium>.freeze, ["~> 0.2.0"])
    s.add_dependency(%q<equalizer>.freeze, ["~> 0.0.9"])
  end
end
