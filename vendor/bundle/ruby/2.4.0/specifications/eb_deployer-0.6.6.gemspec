# -*- encoding: utf-8 -*-
# stub: eb_deployer 0.6.6 ruby lib

Gem::Specification.new do |s|
  s.name = "eb_deployer".freeze
  s.version = "0.6.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["wpc".freeze, "betarelease".freeze, "xli".freeze]
  s.date = "2016-03-18"
  s.description = "For automating Blue-Green deployment flows on Elastic Beanstalk.".freeze
  s.email = ["alex.hal9000@gmail.com".freeze, "sudhindra.r.rao@gmail.com".freeze, "swing1979@gmail.com".freeze]
  s.executables = ["eb_deploy".freeze]
  s.files = ["bin/eb_deploy".freeze]
  s.homepage = "https://github.com/ThoughtWorksStudios/eb_deployer".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.14".freeze
  s.summary = "Low friction deployments should be a breeze. Elastic Beanstalk provides a great foundation for performing Blue-Green deployments, and EbDeployer add a missing top to automate the whole flow out of the box.".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<aws-sdk>.freeze, [">= 2.0.0", "~> 2"])
    else
      s.add_dependency(%q<aws-sdk>.freeze, [">= 2.0.0", "~> 2"])
    end
  else
    s.add_dependency(%q<aws-sdk>.freeze, [">= 2.0.0", "~> 2"])
  end
end
