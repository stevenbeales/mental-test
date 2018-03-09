# -*- encoding: utf-8 -*-
# stub: roodi 3.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "roodi".freeze
  s.version = "3.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Marty Andrews".freeze, "Peter Evjan".freeze]
  s.date = "2013-11-09"
  s.description = "Roodi parses your Ruby code and warns you about design issues you have based on the checks that is has configured".freeze
  s.email = "hello@peterevjan.com".freeze
  s.executables = ["roodi".freeze, "roodi-describe".freeze]
  s.files = ["bin/roodi".freeze, "bin/roodi-describe".freeze]
  s.homepage = "http://github.com/roodi/roodi".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.14".freeze
  s.summary = "Roodi stands for Ruby Object Oriented Design Inferometer".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ruby_parser>.freeze, [">= 3.2.2", "~> 3.2"])
    else
      s.add_dependency(%q<ruby_parser>.freeze, [">= 3.2.2", "~> 3.2"])
    end
  else
    s.add_dependency(%q<ruby_parser>.freeze, [">= 3.2.2", "~> 3.2"])
  end
end
