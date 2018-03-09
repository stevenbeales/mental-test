# -*- encoding: utf-8 -*-
# stub: RubyInline 3.12.4 ruby lib

Gem::Specification.new do |s|
  s.name = "RubyInline".freeze
  s.version = "3.12.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ryan Davis".freeze]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDPjCCAiagAwIBAgIBAjANBgkqhkiG9w0BAQUFADBFMRMwEQYDVQQDDApyeWFu\nZC1ydWJ5MRkwFwYKCZImiZPyLGQBGRYJemVuc3BpZGVyMRMwEQYKCZImiZPyLGQB\nGRYDY29tMB4XDTE0MDkxNzIzMDcwN1oXDTE1MDkxNzIzMDcwN1owRTETMBEGA1UE\nAwwKcnlhbmQtcnVieTEZMBcGCgmSJomT8ixkARkWCXplbnNwaWRlcjETMBEGCgmS\nJomT8ixkARkWA2NvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALda\nb9DCgK+627gPJkB6XfjZ1itoOQvpqH1EXScSaba9/S2VF22VYQbXU1xQXL/WzCkx\ntaCPaLmfYIaFcHHCSY4hYDJijRQkLxPeB3xbOfzfLoBDbjvx5JxgJxUjmGa7xhcT\noOvjtt5P8+GSK9zLzxQP0gVLS/D0FmoE44XuDr3iQkVS2ujU5zZL84mMNqNB1znh\nGiadM9GHRaDiaxuX0cIUBj19T01mVE2iymf9I6bEsiayK/n6QujtyCbTWsAS9Rqt\nqhtV7HJxNKuPj/JFH0D2cswvzznE/a5FOYO68g+YCuFi5L8wZuuM8zzdwjrWHqSV\ngBEfoTEGr7Zii72cx+sCAwEAAaM5MDcwCQYDVR0TBAIwADALBgNVHQ8EBAMCBLAw\nHQYDVR0OBBYEFEfFe9md/r/tj/Wmwpy+MI8d9k/hMA0GCSqGSIb3DQEBBQUAA4IB\nAQAFoDJRokCQdxFfOrmsKX41KOFlU/zjrbDVM9hgB/Ur999M6OXGSi8FitXNtMwY\nFVjsiAPeU7HaWVVcZkj6IhINelTkXsxgGz/qCzjHy3iUMuZWw36cS0fiWJ5rvH+e\nhD7uXxJSFuyf1riDGI1aeWbQ74WMwvNstOxLUMiV5a1fzBhlxPqb537ubDjq/M/h\nzPUFPVYeL5KjDHLCqI2FwIk2sEMOQgjpXHzl+3NlD2LUgUhHDMevmgVua0e2GT1B\nxJcC6UN6NHMOVMyAXsr2HR0gRRx4ofN1LoP2KhXzSr8UMvQYlwPmE0N5GQv1b5AO\nVpzF30vNaJK6ZT7xlIsIlwmH\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2015-04-15"
  s.description = "Inline allows you to write foreign code within your ruby code. It\nautomatically determines if the code in question has changed and\nbuilds it only when necessary. The extensions are then automatically\nloaded into the class/module that defines it.\n\nYou can even write extra builders that will allow you to write inlined\ncode in any language. Use Inline::C as a template and look at\nModule#inline for the required API.".freeze
  s.email = ["ryand-ruby@zenspider.com".freeze]
  s.extra_rdoc_files = ["History.txt".freeze, "Manifest.txt".freeze, "README.txt".freeze]
  s.files = ["History.txt".freeze, "Manifest.txt".freeze, "README.txt".freeze]
  s.homepage = "http://www.zenspider.com/ZSS/Products/RubyInline/".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--main".freeze, "README.txt".freeze]
  s.requirements = ["A POSIX environment and a compiler for your language.".freeze]
  s.rubygems_version = "2.6.14".freeze
  s.summary = "Inline allows you to write foreign code within your ruby code".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ZenTest>.freeze, ["~> 4.3"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.6"])
      s.add_development_dependency(%q<rdoc>.freeze, ["~> 4.0"])
      s.add_development_dependency(%q<hoe>.freeze, ["~> 3.13"])
    else
      s.add_dependency(%q<ZenTest>.freeze, ["~> 4.3"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5.6"])
      s.add_dependency(%q<rdoc>.freeze, ["~> 4.0"])
      s.add_dependency(%q<hoe>.freeze, ["~> 3.13"])
    end
  else
    s.add_dependency(%q<ZenTest>.freeze, ["~> 4.3"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.6"])
    s.add_dependency(%q<rdoc>.freeze, ["~> 4.0"])
    s.add_dependency(%q<hoe>.freeze, ["~> 3.13"])
  end
end
