# -*- encoding: utf-8 -*-
# stub: ZenTest 4.11.1 ruby lib

Gem::Specification.new do |s|
  s.name = "ZenTest".freeze
  s.version = "4.11.1"

  s.required_rubygems_version = Gem::Requirement.new(["< 3.0".freeze, ">= 1.8".freeze]) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ryan Davis".freeze, "Eric Hodel".freeze]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDPjCCAiagAwIBAgIBAzANBgkqhkiG9w0BAQUFADBFMRMwEQYDVQQDDApyeWFu\nZC1ydWJ5MRkwFwYKCZImiZPyLGQBGRYJemVuc3BpZGVyMRMwEQYKCZImiZPyLGQB\nGRYDY29tMB4XDTE1MDkxOTIwNTEyMloXDTE2MDkxODIwNTEyMlowRTETMBEGA1UE\nAwwKcnlhbmQtcnVieTEZMBcGCgmSJomT8ixkARkWCXplbnNwaWRlcjETMBEGCgmS\nJomT8ixkARkWA2NvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALda\nb9DCgK+627gPJkB6XfjZ1itoOQvpqH1EXScSaba9/S2VF22VYQbXU1xQXL/WzCkx\ntaCPaLmfYIaFcHHCSY4hYDJijRQkLxPeB3xbOfzfLoBDbjvx5JxgJxUjmGa7xhcT\noOvjtt5P8+GSK9zLzxQP0gVLS/D0FmoE44XuDr3iQkVS2ujU5zZL84mMNqNB1znh\nGiadM9GHRaDiaxuX0cIUBj19T01mVE2iymf9I6bEsiayK/n6QujtyCbTWsAS9Rqt\nqhtV7HJxNKuPj/JFH0D2cswvzznE/a5FOYO68g+YCuFi5L8wZuuM8zzdwjrWHqSV\ngBEfoTEGr7Zii72cx+sCAwEAAaM5MDcwCQYDVR0TBAIwADALBgNVHQ8EBAMCBLAw\nHQYDVR0OBBYEFEfFe9md/r/tj/Wmwpy+MI8d9k/hMA0GCSqGSIb3DQEBBQUAA4IB\nAQB+Hx8xUgrpZa4P8H8gR8zme5kISwQrG80MbpqJV6/G3/ZicRFhN5sjwu0uHGue\nbd9Cymf6oIRwHVarJux2M32T6bL07Hmi07w2QaPc3MnMKB/D46SRZ2JSSGPFRBTc\nSilobMRoGs/7B15uGFUEnNrCB/ltMqhwwSx1r++UQPfeySHEV9uqu03E5Vb7J37O\n2Er6PLXHRiYsIycD1LkMi6YnixdITRHmrqJYE2rsjaIfpIehiusVAPHkNf7qbpHq\nqx3h45R1CAsObX0SQDIT+rRbQrtKz1GHIZTOFYvEJjUY1XmRTZupD3CJ8Q7sDqSy\nNLq5jm1fq6Y9Uolu3RJbmycf\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2016-06-13"
  s.description = "ZenTest provides 4 different tools: zentest, unit_diff, autotest, and\nmultiruby.\n\nzentest scans your target and unit-test code and writes your missing\ncode based on simple naming rules, enabling XP at a much quicker pace.\nzentest only works with Ruby and Minitest or Test::Unit. There is\nenough evidence to show that this is still proving useful to users, so\nit stays.\n\nunit_diff is a command-line filter to diff expected results from\nactual results and allow you to quickly see exactly what is wrong.\nDo note that minitest 2.2+ provides an enhanced assert_equal obviating\nthe need for unit_diff\n\nautotest is a continous testing facility meant to be used during\ndevelopment. As soon as you save a file, autotest will run the\ncorresponding dependent tests.\n\nmultiruby runs anything you want on multiple versions of ruby. Great\nfor compatibility checking! Use multiruby_setup to manage your\ninstalled versions.\n\n*NOTE:* The next major release of zentest will not include autotest\n(use minitest-autotest instead) and multiruby will use rbenv /\nruby-build for version management.".freeze
  s.email = ["ryand-ruby@zenspider.com".freeze, "drbrain@segment7.net".freeze]
  s.executables = ["autotest".freeze, "multigem".freeze, "multiruby".freeze, "multiruby_setup".freeze, "unit_diff".freeze, "zentest".freeze]
  s.extra_rdoc_files = ["History.txt".freeze, "Manifest.txt".freeze, "README.txt".freeze, "articles/how_to_use_zentest.txt".freeze, "example.txt".freeze]
  s.files = ["History.txt".freeze, "Manifest.txt".freeze, "README.txt".freeze, "articles/how_to_use_zentest.txt".freeze, "bin/autotest".freeze, "bin/multigem".freeze, "bin/multiruby".freeze, "bin/multiruby_setup".freeze, "bin/unit_diff".freeze, "bin/zentest".freeze, "example.txt".freeze]
  s.homepage = "https://github.com/seattlerb/zentest".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--main".freeze, "README.txt".freeze]
  s.rubygems_version = "2.6.14".freeze
  s.summary = "ZenTest provides 4 different tools: zentest, unit_diff, autotest, and multiruby".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rdoc>.freeze, ["~> 4.0"])
      s.add_development_dependency(%q<hoe>.freeze, ["~> 3.15"])
    else
      s.add_dependency(%q<rdoc>.freeze, ["~> 4.0"])
      s.add_dependency(%q<hoe>.freeze, ["~> 3.15"])
    end
  else
    s.add_dependency(%q<rdoc>.freeze, ["~> 4.0"])
    s.add_dependency(%q<hoe>.freeze, ["~> 3.15"])
  end
end
