# -*- encoding: utf-8 -*-
# stub: redcard 1.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "redcard".freeze
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Brian Shirai".freeze]
  s.date = "2013-03-23"
  s.email = ["brixen@gmail.com".freeze]
  s.extra_rdoc_files = ["README.md".freeze, "LICENSE".freeze]
  s.files = ["LICENSE".freeze, "README.md".freeze]
  s.homepage = "https://github.com/brixen/redcard".freeze
  s.rdoc_options = ["--title".freeze, "RedCard Gem".freeze, "--main".freeze, "README".freeze, "--line-numbers".freeze]
  s.rubygems_version = "2.6.14".freeze
  s.summary = "RedCard provides a standard way to ensure that the running Ruby implementation matches the desired language version, implementation, and implementation version.".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>.freeze, ["~> 0.9"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 2.8"])
    else
      s.add_dependency(%q<rake>.freeze, ["~> 0.9"])
      s.add_dependency(%q<rspec>.freeze, ["~> 2.8"])
    end
  else
    s.add_dependency(%q<rake>.freeze, ["~> 0.9"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.8"])
  end
end
