# -*- encoding: utf-8 -*-
# stub: procto 0.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "procto".freeze
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Martin Gamsjaeger (snusnu)".freeze]
  s.date = "2016-02-29"
  s.description = "Turns your object into a method object".freeze
  s.email = ["gamsnjaga@gmail.com".freeze]
  s.extra_rdoc_files = ["LICENSE".freeze, "README.md".freeze, "CONTRIBUTING.md".freeze]
  s.files = ["CONTRIBUTING.md".freeze, "LICENSE".freeze, "README.md".freeze]
  s.homepage = "https://github.com/snusnu/procto".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.14".freeze
  s.summary = "Defines Foo.call(*args) which invokes Foo.new(*args).bar".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1"])
  end
end
