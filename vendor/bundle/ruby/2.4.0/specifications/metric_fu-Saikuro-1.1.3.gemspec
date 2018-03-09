# -*- encoding: utf-8 -*-
# stub: metric_fu-Saikuro 1.1.3 ruby lib

Gem::Specification.new do |s|
  s.name = "metric_fu-Saikuro".freeze
  s.version = "1.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Zev Blut".freeze, "David Barri".freeze]
  s.date = "2014-01-21"
  s.description = "When given Ruby\n  source code Saikuro will generate a report listing the cyclomatic\n  complexity of each method found.  In addition, Saikuro counts the\n  number of lines per method and can generate a listing of the number of\n  tokens on each line of code.".freeze
  s.email = ["zb@ubit.com".freeze, "japgolly@gmail.com".freeze]
  s.executables = ["saikuro".freeze]
  s.extra_rdoc_files = ["README".freeze]
  s.files = ["README".freeze, "bin/saikuro".freeze]
  s.homepage = "https://github.com/metricfu/Saikuro".freeze
  s.licenses = ["BSD".freeze]
  s.rubyforge_project = "Saikuro".freeze
  s.rubygems_version = "2.6.14".freeze
  s.summary = "Saikuro is a Ruby cyclomatic complexity analyzer.".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version
end
