# -*- encoding: utf-8 -*-
# stub: fuubar 2.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "fuubar".freeze
  s.version = "2.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nicholas Evans".freeze, "Jeff Kreeftmeijer".freeze, "jfelchner".freeze]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDrjCCApagAwIBAgIBATANBgkqhkiG9w0BAQUFADBOMRowGAYDVQQDDBFhY2Nv\ndW50c19ydWJ5Z2VtczEbMBkGCgmSJomT8ixkARkWC3RoZWtvbXBhbmVlMRMwEQYK\nCZImiZPyLGQBGRYDY29tMB4XDTE3MTIzMTIzMzUwNloXDTE4MTIzMTIzMzUwNlow\nTjEaMBgGA1UEAwwRYWNjb3VudHNfcnVieWdlbXMxGzAZBgoJkiaJk/IsZAEZFgt0\naGVrb21wYW5lZTETMBEGCgmSJomT8ixkARkWA2NvbTCCASIwDQYJKoZIhvcNAQEB\nBQADggEPADCCAQoCggEBAO4TFnvU5R1rchKsNvNEiZUlOTuMtuE+OvMW4aOk3tIP\nJpczhDnRSLpbkpVvsuwfT9PgLjnAuan4oLB0eQVaOAgATFbmAfMsfU0gGtSWlczx\n6vZjQqyGsW3P1abgGquLVubj409FMxfV18JUZlEmvCE1y9bM61gZ3oHTFPvBDoyX\n3g9or9nenIa5jcJZd4C3ujW8yOxD+UskgAp+iZI2mIRtt2cJVg2/dnFAgqqp7Xy4\nc4OHZ6hqp2UcvhzuEdUJ6yRA8+Gn3jPOD+uXgUG84FfmU++NVoZyz+r0Nwa+De0H\nIObr8jftfL0PGdR8t1K61g12dZwGmpYTzmoJ1C+yS2ECAwEAAaOBljCBkzAJBgNV\nHRMEAjAAMAsGA1UdDwQEAwIEsDAdBgNVHQ4EFgQUxmSoxOGENcFagbIbl/CikHCU\nhyMwLAYDVR0RBCUwI4EhYWNjb3VudHMrcnVieWdlbXNAdGhla29tcGFuZWUuY29t\nMCwGA1UdEgQlMCOBIWFjY291bnRzK3J1YnlnZW1zQHRoZWtvbXBhbmVlLmNvbTAN\nBgkqhkiG9w0BAQUFAAOCAQEAoiXGZB5aUV/31MOlrY6Jmfk/4+kIBcgrOCMCi3Nn\n58fZ/LJDmxs+C3zdW0wHxYf06r3ZcHTulhk1suztLCWyUxyOkGj4IW+LXPRGP66o\n6qcofBVFh7GXatsgbj87f7a8/opXaeQHqC2X18sCTwOCcO5PjtFrXK7A3v1u2yRj\nrEe6qyTkY77mRgG3f/feAizAvYYkPxOngUwN8rpfKpU5iESS4UUaxIi3AGJHgTw2\netYUO0DlNY/qYfSfExrgt0W5dZeT09V++WPlYauHw/EZtAB0AsJwVdtIscq0HSvX\nyH9AFp3KIe0v70EXzao/94n+XoDULrHEhqGMo34iS+37ZA==\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2018-01-02"
  s.description = "the instafailing RSpec progress bar formatter".freeze
  s.email = "[\"jeff@kreeftmeijer.nl\", \"accounts+git@thekompanee.com\"]".freeze
  s.homepage = "https://github.com/thekompanee/fuubar".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.14".freeze
  s.summary = "the instafailing RSpec progress bar formatter".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rspec-core>.freeze, ["~> 3.0"])
      s.add_runtime_dependency(%q<ruby-progressbar>.freeze, ["~> 1.4"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<chamber>.freeze, ["~> 2.3"])
      s.add_development_dependency(%q<awesome_print>.freeze, ["~> 1.7"])
    else
      s.add_dependency(%q<rspec-core>.freeze, ["~> 3.0"])
      s.add_dependency(%q<ruby-progressbar>.freeze, ["~> 1.4"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<chamber>.freeze, ["~> 2.3"])
      s.add_dependency(%q<awesome_print>.freeze, ["~> 1.7"])
    end
  else
    s.add_dependency(%q<rspec-core>.freeze, ["~> 3.0"])
    s.add_dependency(%q<ruby-progressbar>.freeze, ["~> 1.4"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<chamber>.freeze, ["~> 2.3"])
    s.add_dependency(%q<awesome_print>.freeze, ["~> 1.7"])
  end
end
