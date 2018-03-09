# -*- encoding: utf-8 -*-
# stub: heckle 1.4.3 ruby lib

Gem::Specification.new do |s|
  s.name = "heckle".freeze
  s.version = "1.4.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ryan Davis".freeze, "Eric Hodel".freeze, "Kevin Clark".freeze]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDPjCCAiagAwIBAgIBADANBgkqhkiG9w0BAQUFADBFMRMwEQYDVQQDDApyeWFu\nZC1ydWJ5MRkwFwYKCZImiZPyLGQBGRYJemVuc3BpZGVyMRMwEQYKCZImiZPyLGQB\nGRYDY29tMB4XDTA5MDMwNjE4NTMxNVoXDTEwMDMwNjE4NTMxNVowRTETMBEGA1UE\nAwwKcnlhbmQtcnVieTEZMBcGCgmSJomT8ixkARkWCXplbnNwaWRlcjETMBEGCgmS\nJomT8ixkARkWA2NvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALda\nb9DCgK+627gPJkB6XfjZ1itoOQvpqH1EXScSaba9/S2VF22VYQbXU1xQXL/WzCkx\ntaCPaLmfYIaFcHHCSY4hYDJijRQkLxPeB3xbOfzfLoBDbjvx5JxgJxUjmGa7xhcT\noOvjtt5P8+GSK9zLzxQP0gVLS/D0FmoE44XuDr3iQkVS2ujU5zZL84mMNqNB1znh\nGiadM9GHRaDiaxuX0cIUBj19T01mVE2iymf9I6bEsiayK/n6QujtyCbTWsAS9Rqt\nqhtV7HJxNKuPj/JFH0D2cswvzznE/a5FOYO68g+YCuFi5L8wZuuM8zzdwjrWHqSV\ngBEfoTEGr7Zii72cx+sCAwEAAaM5MDcwCQYDVR0TBAIwADALBgNVHQ8EBAMCBLAw\nHQYDVR0OBBYEFEfFe9md/r/tj/Wmwpy+MI8d9k/hMA0GCSqGSIb3DQEBBQUAA4IB\nAQAY59gYvDxqSqgC92nAP9P8dnGgfZgLxP237xS6XxFGJSghdz/nI6pusfCWKM8m\nvzjjH2wUMSSf3tNudQ3rCGLf2epkcU13/rguI88wO6MrE0wi4ZqLQX+eZQFskJb/\nw6x9W1ur8eR01s397LSMexySDBrJOh34cm2AlfKr/jokKCTwcM0OvVZnAutaovC0\nl1SVZ0ecg88bsWHA0Yhh7NFxK1utWoIhtB6AFC/+trM0FQEB/jZkIS8SaNzn96Rl\nn0sZEf77FLf5peR8TP/PtmIg7Cyqz23sLM4mCOoTGIy5OcZ8TdyiyINUHtb5ej/T\nFBHgymkyj/AOSqKRIpXPhjC6\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2009-06-23"
  s.description = "Heckle is unit test sadism(tm) at it's core. Heckle is a mutation tester. It modifies your code and runs your tests to make sure they fail. The idea is that if code can be changed and your tests don't notice, either that code isn't being covered or it doesn't do anything.\n\nIt's like hiring a white-hat hacker to try to break into your server and making sure you detect it. You learn the most by trying to break things and watching the outcome in an act of unit test sadism.".freeze
  s.email = ["ryand-ruby@zenspider.com".freeze, "drbrain@segment7.net".freeze, "kevin.clark@gmail.com".freeze]
  s.executables = ["heckle".freeze]
  s.extra_rdoc_files = ["History.txt".freeze, "Manifest.txt".freeze, "README.txt".freeze]
  s.files = ["History.txt".freeze, "Manifest.txt".freeze, "README.txt".freeze, "bin/heckle".freeze]
  s.homepage = "http://www.rubyforge.org/projects/seattlerb".freeze
  s.rdoc_options = ["--main".freeze, "README.txt".freeze]
  s.rubyforge_project = "seattlerb".freeze
  s.rubygems_version = "2.6.14".freeze
  s.summary = "Heckle is unit test sadism(tm) at it's core".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ParseTree>.freeze, [">= 2.0.0"])
      s.add_runtime_dependency(%q<ruby2ruby>.freeze, [">= 1.1.6"])
      s.add_runtime_dependency(%q<ZenTest>.freeze, [">= 3.5.2"])
      s.add_development_dependency(%q<hoe>.freeze, [">= 2.3.0"])
    else
      s.add_dependency(%q<ParseTree>.freeze, [">= 2.0.0"])
      s.add_dependency(%q<ruby2ruby>.freeze, [">= 1.1.6"])
      s.add_dependency(%q<ZenTest>.freeze, [">= 3.5.2"])
      s.add_dependency(%q<hoe>.freeze, [">= 2.3.0"])
    end
  else
    s.add_dependency(%q<ParseTree>.freeze, [">= 2.0.0"])
    s.add_dependency(%q<ruby2ruby>.freeze, [">= 1.1.6"])
    s.add_dependency(%q<ZenTest>.freeze, [">= 3.5.2"])
    s.add_dependency(%q<hoe>.freeze, [">= 2.3.0"])
  end
end
