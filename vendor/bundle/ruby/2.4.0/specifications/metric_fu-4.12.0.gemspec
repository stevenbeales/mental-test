# -*- encoding: utf-8 -*-
# stub: metric_fu 4.12.0 ruby lib

Gem::Specification.new do |s|
  s.name = "metric_fu".freeze
  s.version = "4.12.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jake Scruggs".freeze, "Sean Soper".freeze, "Andre Arko".freeze, "Petrik de Heus".freeze, "Grant McInnes".freeze, "Nick Quaranto".freeze, "\u00C9douard Bri\u00E8re".freeze, "Carl Youngblood".freeze, "Richard Huang".freeze, "Dan Mayer".freeze, "Benjamin Fleischer".freeze, "Robin Curry".freeze]
  s.cert_chain = ["certs/bf4.pem".freeze]
  s.date = "2015-06-18"
  s.description = "Code metrics from Flog, Flay, Saikuro, Churn, Reek, Roodi, Code Statistics, and Rails Best Practices. (and optionally RCov)".freeze
  s.email = "github@benjaminfleischer.com".freeze
  s.executables = ["metric_fu".freeze, "mf-cane".freeze, "mf-churn".freeze, "mf-flay".freeze, "mf-reek".freeze, "mf-roodi".freeze, "mf-saikuro".freeze]
  s.extra_rdoc_files = ["HISTORY.md".freeze, "CONTRIBUTING.md".freeze, "TODO.md".freeze, "MIT-LICENSE".freeze]
  s.files = ["CONTRIBUTING.md".freeze, "HISTORY.md".freeze, "MIT-LICENSE".freeze, "TODO.md".freeze, "bin/metric_fu".freeze, "bin/mf-cane".freeze, "bin/mf-churn".freeze, "bin/mf-flay".freeze, "bin/mf-reek".freeze, "bin/mf-roodi".freeze, "bin/mf-saikuro".freeze]
  s.homepage = "https://github.com/metricfu/metric_fu".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--main".freeze, "README.md".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.0".freeze)
  s.rubyforge_project = "metric_fu".freeze
  s.rubygems_version = "2.6.14".freeze
  s.summary = "A fistful of code metrics, with awesome templates and graphs".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<flay>.freeze, [">= 2.0.1", "~> 2.1"])
      s.add_runtime_dependency(%q<churn>.freeze, ["~> 0.0.35"])
      s.add_runtime_dependency(%q<flog>.freeze, [">= 4.1.1", "~> 4.1"])
      s.add_runtime_dependency(%q<reek>.freeze, ["< 3.0", ">= 1.3.4"])
      s.add_runtime_dependency(%q<cane>.freeze, [">= 2.5.2", "~> 2.5"])
      s.add_runtime_dependency(%q<rails_best_practices>.freeze, [">= 1.14.3", "~> 1.14"])
      s.add_runtime_dependency(%q<metric_fu-Saikuro>.freeze, [">= 1.1.3", "~> 1.1"])
      s.add_runtime_dependency(%q<roodi>.freeze, ["~> 3.1"])
      s.add_runtime_dependency(%q<code_metrics>.freeze, ["~> 0.1"])
      s.add_runtime_dependency(%q<redcard>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<coderay>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<multi_json>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<launchy>.freeze, ["~> 2.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.1"])
      s.add_development_dependency(%q<test_construct>.freeze, [">= 0"])
      s.add_development_dependency(%q<json>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.9"])
    else
      s.add_dependency(%q<flay>.freeze, [">= 2.0.1", "~> 2.1"])
      s.add_dependency(%q<churn>.freeze, ["~> 0.0.35"])
      s.add_dependency(%q<flog>.freeze, [">= 4.1.1", "~> 4.1"])
      s.add_dependency(%q<reek>.freeze, ["< 3.0", ">= 1.3.4"])
      s.add_dependency(%q<cane>.freeze, [">= 2.5.2", "~> 2.5"])
      s.add_dependency(%q<rails_best_practices>.freeze, [">= 1.14.3", "~> 1.14"])
      s.add_dependency(%q<metric_fu-Saikuro>.freeze, [">= 1.1.3", "~> 1.1"])
      s.add_dependency(%q<roodi>.freeze, ["~> 3.1"])
      s.add_dependency(%q<code_metrics>.freeze, ["~> 0.1"])
      s.add_dependency(%q<redcard>.freeze, [">= 0"])
      s.add_dependency(%q<coderay>.freeze, [">= 0"])
      s.add_dependency(%q<multi_json>.freeze, [">= 0"])
      s.add_dependency(%q<launchy>.freeze, ["~> 2.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.1"])
      s.add_dependency(%q<test_construct>.freeze, [">= 0"])
      s.add_dependency(%q<json>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov>.freeze, ["~> 0.9"])
    end
  else
    s.add_dependency(%q<flay>.freeze, [">= 2.0.1", "~> 2.1"])
    s.add_dependency(%q<churn>.freeze, ["~> 0.0.35"])
    s.add_dependency(%q<flog>.freeze, [">= 4.1.1", "~> 4.1"])
    s.add_dependency(%q<reek>.freeze, ["< 3.0", ">= 1.3.4"])
    s.add_dependency(%q<cane>.freeze, [">= 2.5.2", "~> 2.5"])
    s.add_dependency(%q<rails_best_practices>.freeze, [">= 1.14.3", "~> 1.14"])
    s.add_dependency(%q<metric_fu-Saikuro>.freeze, [">= 1.1.3", "~> 1.1"])
    s.add_dependency(%q<roodi>.freeze, ["~> 3.1"])
    s.add_dependency(%q<code_metrics>.freeze, ["~> 0.1"])
    s.add_dependency(%q<redcard>.freeze, [">= 0"])
    s.add_dependency(%q<coderay>.freeze, [">= 0"])
    s.add_dependency(%q<multi_json>.freeze, [">= 0"])
    s.add_dependency(%q<launchy>.freeze, ["~> 2.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.1"])
    s.add_dependency(%q<test_construct>.freeze, [">= 0"])
    s.add_dependency(%q<json>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.9"])
  end
end
