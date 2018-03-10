# -*- encoding: utf-8 -*-
# stub: code_metrics 0.1.3 ruby lib

Gem::Specification.new do |s|
  s.name = "code_metrics".freeze
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.7".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["David Heinemeier Hansson".freeze, "Benjamin Fleischer".freeze]
  s.date = "2013-12-31"
  s.description = "rake stats is great for looking at statistics on your code, displaying things like KLOCs (thousands of lines of code) and your code to test ratio.".freeze
  s.email = ["david@loudthinking.com".freeze, "github@benjaminfleischer.com".freeze]
  s.executables = ["code_metrics".freeze, "code_metrics-profile".freeze]
  s.files = ["bin/code_metrics".freeze, "bin/code_metrics-profile".freeze]
  s.homepage = "https://github.com/bf4/code_metrics".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.0".freeze)
  s.rubygems_version = "2.6.14".freeze
  s.summary = "Extraction of the rails rake stats task as a gem and rails plugin".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rails>.freeze, ["< 5.0", "> 3.0"])
    else
      s.add_dependency(%q<rails>.freeze, ["< 5.0", "> 3.0"])
    end
  else
    s.add_dependency(%q<rails>.freeze, ["< 5.0", "> 3.0"])
  end
end
