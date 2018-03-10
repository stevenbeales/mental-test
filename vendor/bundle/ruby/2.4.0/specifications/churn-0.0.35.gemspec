# -*- encoding: utf-8 -*-
# stub: churn 0.0.35 ruby lib

Gem::Specification.new do |s|
  s.name = "churn".freeze
  s.version = "0.0.35"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Dan Mayer".freeze]
  s.date = "2012-12-17"
  s.description = "High method and class churn has been shown to have increased bug and error rates. This gem helps you know what is changing a lot so you can do additional testing, code review, or refactoring to try to tame the volatile code. ".freeze
  s.email = "dan@mayerdan.com".freeze
  s.executables = ["churn".freeze]
  s.extra_rdoc_files = ["LICENSE".freeze, "README.md".freeze]
  s.files = ["LICENSE".freeze, "README.md".freeze, "bin/churn".freeze]
  s.homepage = "http://github.com/danmayer/churn".freeze
  s.licenses = ["MIT".freeze]
  s.rubyforge_project = "churn".freeze
  s.rubygems_version = "2.6.14".freeze
  s.summary = "Providing additional churn metrics over the original metric_fu churn".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>.freeze, [">= 0"])
      s.add_development_dependency(%q<test-construct>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<mocha>.freeze, ["~> 0.9.5"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<rdoc>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<main>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<json_pure>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<chronic>.freeze, [">= 0.2.3"])
      s.add_runtime_dependency(%q<sexp_processor>.freeze, ["~> 4.1"])
      s.add_runtime_dependency(%q<ruby_parser>.freeze, ["~> 3.0"])
      s.add_runtime_dependency(%q<hirb>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<rest-client>.freeze, [">= 1.6.0"])
    else
      s.add_dependency(%q<shoulda>.freeze, [">= 0"])
      s.add_dependency(%q<test-construct>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<mocha>.freeze, ["~> 0.9.5"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<rdoc>.freeze, [">= 0"])
      s.add_dependency(%q<main>.freeze, [">= 0"])
      s.add_dependency(%q<json_pure>.freeze, [">= 0"])
      s.add_dependency(%q<chronic>.freeze, [">= 0.2.3"])
      s.add_dependency(%q<sexp_processor>.freeze, ["~> 4.1"])
      s.add_dependency(%q<ruby_parser>.freeze, ["~> 3.0"])
      s.add_dependency(%q<hirb>.freeze, [">= 0"])
      s.add_dependency(%q<rest-client>.freeze, [">= 1.6.0"])
    end
  else
    s.add_dependency(%q<shoulda>.freeze, [">= 0"])
    s.add_dependency(%q<test-construct>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<mocha>.freeze, ["~> 0.9.5"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<rdoc>.freeze, [">= 0"])
    s.add_dependency(%q<main>.freeze, [">= 0"])
    s.add_dependency(%q<json_pure>.freeze, [">= 0"])
    s.add_dependency(%q<chronic>.freeze, [">= 0.2.3"])
    s.add_dependency(%q<sexp_processor>.freeze, ["~> 4.1"])
    s.add_dependency(%q<ruby_parser>.freeze, ["~> 3.0"])
    s.add_dependency(%q<hirb>.freeze, [">= 0"])
    s.add_dependency(%q<rest-client>.freeze, [">= 1.6.0"])
  end
end
