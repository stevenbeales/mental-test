# -*- encoding: utf-8 -*-
# stub: unparser 0.2.7 ruby lib

Gem::Specification.new do |s|
  s.name = "unparser".freeze
  s.version = "0.2.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Markus Schirp".freeze]
  s.date = "2018-03-09"
  s.description = "Generate equivalent source for parser gem AST nodes".freeze
  s.email = "mbj@schirp-dso.com".freeze
  s.executables = ["unparser".freeze]
  s.extra_rdoc_files = ["README.md".freeze]
  s.files = ["README.md".freeze, "bin/unparser".freeze]
  s.homepage = "http://github.com/mbj/unparser".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1".freeze)
  s.rubygems_version = "2.6.14".freeze
  s.summary = "Generate equivalent source for parser gem AST nodes".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<abstract_type>.freeze, ["~> 0.0.7"])
      s.add_runtime_dependency(%q<adamantium>.freeze, ["~> 0.2.0"])
      s.add_runtime_dependency(%q<equalizer>.freeze, ["~> 0.0.9"])
      s.add_runtime_dependency(%q<diff-lcs>.freeze, ["~> 1.3"])
      s.add_runtime_dependency(%q<concord>.freeze, ["~> 0.1.5"])
      s.add_runtime_dependency(%q<parser>.freeze, ["< 2.6", ">= 2.3.1.2"])
      s.add_runtime_dependency(%q<procto>.freeze, ["~> 0.0.2"])
      s.add_development_dependency(%q<anima>.freeze, ["~> 0.3.0"])
      s.add_development_dependency(%q<devtools>.freeze, ["~> 0.1.3"])
      s.add_development_dependency(%q<morpher>.freeze, ["~> 0.2.6"])
    else
      s.add_dependency(%q<abstract_type>.freeze, ["~> 0.0.7"])
      s.add_dependency(%q<adamantium>.freeze, ["~> 0.2.0"])
      s.add_dependency(%q<equalizer>.freeze, ["~> 0.0.9"])
      s.add_dependency(%q<diff-lcs>.freeze, ["~> 1.3"])
      s.add_dependency(%q<concord>.freeze, ["~> 0.1.5"])
      s.add_dependency(%q<parser>.freeze, ["< 2.6", ">= 2.3.1.2"])
      s.add_dependency(%q<procto>.freeze, ["~> 0.0.2"])
      s.add_dependency(%q<anima>.freeze, ["~> 0.3.0"])
      s.add_dependency(%q<devtools>.freeze, ["~> 0.1.3"])
      s.add_dependency(%q<morpher>.freeze, ["~> 0.2.6"])
    end
  else
    s.add_dependency(%q<abstract_type>.freeze, ["~> 0.0.7"])
    s.add_dependency(%q<adamantium>.freeze, ["~> 0.2.0"])
    s.add_dependency(%q<equalizer>.freeze, ["~> 0.0.9"])
    s.add_dependency(%q<diff-lcs>.freeze, ["~> 1.3"])
    s.add_dependency(%q<concord>.freeze, ["~> 0.1.5"])
    s.add_dependency(%q<parser>.freeze, ["< 2.6", ">= 2.3.1.2"])
    s.add_dependency(%q<procto>.freeze, ["~> 0.0.2"])
    s.add_dependency(%q<anima>.freeze, ["~> 0.3.0"])
    s.add_dependency(%q<devtools>.freeze, ["~> 0.1.3"])
    s.add_dependency(%q<morpher>.freeze, ["~> 0.2.6"])
  end
end
