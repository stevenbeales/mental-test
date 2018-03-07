# -*- encoding: utf-8 -*-
# stub: travis 1.8.8 ruby lib

Gem::Specification.new do |s|
  s.name = "travis".freeze
  s.version = "1.8.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Konstantin Haase".freeze, "Hiro Asari".freeze, "Henrik Hodne".freeze, "joshua-anderson".freeze, "Aaron Hill".freeze, "Peter Souter".freeze, "Christopher Grim".freeze, "Joe Corcoran".freeze, "Peter van Dijk".freeze, "Max Barnash".freeze, "Dan Buch".freeze, "Mathias Meyer".freeze, "carlad".freeze, "Carlos Palhares".freeze, "Ren\u00E9e Hendricksen".freeze, "David Rodr\u00EDguez".freeze, "Corinna Wiesner".freeze, "Stefan Nordhausen".freeze, "Thais Camilo and Konstantin Haase".freeze, "Andreas Tiefenthaler".freeze, "Matthias Bussonnier".freeze, "Michael Mior".freeze, "Miro Hron\u010Dok".freeze, "Neamar".freeze, "Nicolas Bessi (nbessi)".freeze, "Peter Bengtsson".freeze, "Piotr Sarnacki".freeze, "Rapha\u00EBl Pinson".freeze, "Rob Hoelz".freeze, "Robert Van Voorhees".freeze, "Zachary Gershman".freeze, "Zachary Scott".freeze, "jeffdh".freeze, "john muhl".freeze, "Tobias Wilken".freeze, "Adam Lavin".freeze, "Adrien Brault".freeze, "Basarat Ali Syed".freeze, "Benjamin Manns".freeze, "Daniel Chatfield".freeze, "Eric Herot".freeze, "George Millo".freeze, "Jacob Atzen".freeze, "Jacob Burkhart".freeze, "Joe Rafaniello".freeze, "Jon-Erik Schneiderhan".freeze, "Jonas Chromik".freeze, "Jonne Ha\u00DF".freeze, "Josh Kalderimis".freeze, "Julia S.Simon".freeze, "Justin Lambert".freeze, "Laurent Petit".freeze, "Maarten van Vliet".freeze, "Mario Visic".freeze]
  s.date = "2017-03-03"
  s.description = "CLI and Ruby client library for Travis CI".freeze
  s.email = ["konstantin.mailinglists@googlemail.com".freeze, "asari.ruby@gmail.com".freeze, "me@henrikhodne.com".freeze, "j@zatigo.com".freeze, "aa1ronham@gmail.com".freeze, "p.morsou@gmail.com".freeze, "chrisg@luminal.io".freeze, "joe@corcoran.io".freeze, "peter.van.dijk@netherlabs.nl".freeze, "i.am@anhero.ru".freeze, "meyer@paperplanes.de".freeze, "me@xjunior.me".freeze, "dan@meatballhat.com".freeze, "renee@travis-ci.org".freeze, "at@an-ti.eu".freeze, "wiesner@avarteq.de".freeze, "deivid.rodriguez@gmail.com".freeze, "stefan.nordhausen@immobilienscout24.de".freeze, "dev+narwen+rkh@rkh.im".freeze, "carlad@users.noreply.github.com".freeze, "jrafanie@users.noreply.github.com".freeze, "Jonas.Chromik@student.hpi.uni-potsdam.de".freeze, "me@jhass.eu".freeze, "josh.kalderimis@gmail.com".freeze, "julia.simon@biicode.com".freeze, "jlambert@eml.cc".freeze, "georgejulianmillo@gmail.com".freeze, "laurent.petit@gmail.com".freeze, "maartenvanvliet@gmail.com".freeze, "mario@mariovisic.com".freeze, "eric.github@herot.com".freeze, "bussonniermatthias@gmail.com".freeze, "chatfielddaniel@gmail.com".freeze, "mmior@uwaterloo.ca".freeze, "miro@hroncok.cz".freeze, "neamar@neamar.fr".freeze, "nbessi@users.noreply.github.com".freeze, "peterbe@mozilla.com".freeze, "benmanns@gmail.com".freeze, "basaratali@gmail.com".freeze, "drogus@gmail.com".freeze, "raphael.pinson@camptocamp.com".freeze, "adrien.brault@gmail.com".freeze, "rob@hoelz.ro".freeze, "rcvanvo@gmail.com".freeze, "jeffdh@gmail.com".freeze, "git@johnmuhl.com".freeze, "tw@cloudcontrol.de".freeze, "pair+zg@pivotallabs.com".freeze, "e@zzak.io".freeze, "carla@travis-ci.org".freeze, "adam@lavoaster.co.uk".freeze, "jburkhart@engineyard.com".freeze, "jatzen@gmail.com".freeze, "jon-erik.schneiderhan@meyouhealth.com".freeze]
  s.executables = ["travis".freeze]
  s.files = ["bin/travis".freeze]
  s.homepage = "https://github.com/travis-ci/travis.rb".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.14".freeze
  s.summary = "Travis CI client".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<faraday>.freeze, ["~> 0.9"])
      s.add_runtime_dependency(%q<faraday_middleware>.freeze, [">= 0.9.1", "~> 0.9"])
      s.add_runtime_dependency(%q<highline>.freeze, ["~> 1.6"])
      s.add_runtime_dependency(%q<backports>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<gh>.freeze, ["~> 0.13"])
      s.add_runtime_dependency(%q<launchy>.freeze, ["~> 2.1"])
      s.add_runtime_dependency(%q<typhoeus>.freeze, [">= 0.6.8", "~> 0.6"])
      s.add_runtime_dependency(%q<pusher-client>.freeze, ["~> 0.4"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 2.12"])
      s.add_development_dependency(%q<sinatra>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rack-test>.freeze, ["~> 0.6"])
    else
      s.add_dependency(%q<faraday>.freeze, ["~> 0.9"])
      s.add_dependency(%q<faraday_middleware>.freeze, [">= 0.9.1", "~> 0.9"])
      s.add_dependency(%q<highline>.freeze, ["~> 1.6"])
      s.add_dependency(%q<backports>.freeze, [">= 0"])
      s.add_dependency(%q<gh>.freeze, ["~> 0.13"])
      s.add_dependency(%q<launchy>.freeze, ["~> 2.1"])
      s.add_dependency(%q<typhoeus>.freeze, [">= 0.6.8", "~> 0.6"])
      s.add_dependency(%q<pusher-client>.freeze, ["~> 0.4"])
      s.add_dependency(%q<rspec>.freeze, ["~> 2.12"])
      s.add_dependency(%q<sinatra>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rack-test>.freeze, ["~> 0.6"])
    end
  else
    s.add_dependency(%q<faraday>.freeze, ["~> 0.9"])
    s.add_dependency(%q<faraday_middleware>.freeze, [">= 0.9.1", "~> 0.9"])
    s.add_dependency(%q<highline>.freeze, ["~> 1.6"])
    s.add_dependency(%q<backports>.freeze, [">= 0"])
    s.add_dependency(%q<gh>.freeze, ["~> 0.13"])
    s.add_dependency(%q<launchy>.freeze, ["~> 2.1"])
    s.add_dependency(%q<typhoeus>.freeze, [">= 0.6.8", "~> 0.6"])
    s.add_dependency(%q<pusher-client>.freeze, ["~> 0.4"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.12"])
    s.add_dependency(%q<sinatra>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rack-test>.freeze, ["~> 0.6"])
  end
end
