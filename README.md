# Mental Test

[![Build Status](https://travis-ci.org/stevenbeales/mental-test.png)](https://travis-ci.org/stevenbeales/mental-test)

[![Coverage Status](https://coveralls.io/repos/stevenbeales/mental-test/badge.svg?branch=master)](https://coveralls.io/r/stevenbeales/mental-test?branch=master)

[![Dependency Status](https://beta.gemnasium.com/badges/github.com/stevenbeales/mental-test.svg)](https://beta.gemnasium.com/projects/github.com/stevenbeales/mental-test)

[![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/stevenbeales/mental-test/badges/quality-score.png?b=master)](https://scrutinizer-ci.com/g/stevenbeales/mental-test/?branch=master)

[![Maintainability](https://api.codeclimate.com/v1/badges/6574b93819edbc0cff7d/maintainability)](https://codeclimate.com/github/stevenbeales/mental-test/maintainability)

[![Inline docs](http://inch-ci.org/github/stevenbeales/mental-test.svg?branch=master)](http://inch-ci.org/github/stevenbeales/mental-test)

[![license](https://img.shields.io/github/license/mashape/apistatus.svg)](https://opensource.org/licenses/MIT)

Disclaimer. These statements have not been validated by the FDA. This skill is not intended to diagnose or treat any condition.

An Alexa skill for validated Mental Health Self-Assessments, written in Ruby using the Sinatra and Ralyxa frameworks.

The application supports importing Surveys and Instruments from SurveyJS.io and REDCap.

Installation instructions for developers

Ruby Version

2.4.4 or higher

To install dependencies -

1) Install Postgres 9.4 or higher. This skill uses Postgres jsonb columns to store indexed unstructured data.
2) Use bundler - bundle install - to install all other gems from the Gemfile.
3) bundle exec rake db:setup - To generate test and development databases and seed the databases with test data
4) Supports Travis online Continuous Integration if you have linked Travis CI and Github accounts. (see./travis.yml for configuration)
5) Supports CodeClimate online Code Quality and Coverage if you have linked CodeClimate account. (see ./codeclimate.yml for configuration)
6) Supports Coveralls online Code Coverage if you have linked Coveralls.io account. (see ./simplecov and ./coveralls.yml for configuration)
7) Supports Gemnasium online Dependency Checker if you have linked Gemnasium account.
8) Supports Scrutinizer online Code Quality checks if you have linked Scrutinizer account (see ./scrutinizer.yml for configuration)
9) Supports Inch online Documentation Quality checks if you have linked Inch account (see ./inch.yml for configuration)

To run the test suite -

1) bundle exec rake spec

To generate the skill documentation -

1) rake rdoc

## Contributing

See the [Contribution Guidelines](https://github.com/stevenbeales/mental-test/blob/master/CONTRIBUTING.md)

Please install Overcommit (gem install overcommit).

Overcommit Git hooks exist to check check-in comments and to check code against:

Reek (check for code smells - see ./config.reek for configuration)
Bundle-audit (check for security vulnerabilities)
Rubocop (lint code - see ./rubocop.yml for configuration)
Fasterer (performance checks - see ./fasterer.yml for configuration)

See ./overcommit.yml for Overcommit configuration

### Resources

- [Git Repository](https://github.com/stevenbeales/mental-test)
- [Git Repository Mental-Test Alexa Skill CLI](https://github.com/stevenbeales/mental-health)
- [Git Repository Mental-Test Survey Editor](https://github.com/stevenbeales/mental-editor)
