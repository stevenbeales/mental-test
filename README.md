# Mental Test

[![Build Status](https://travis-ci.org/stevenbeales/mental-test.png)](https://travis-ci.org/stevenbeales/mental-test)

<a href="https://codeclimate.com/github/stevenbeales/mental-test/maintainability"><img src="https://api.codeclimate.com/v1/badges/6574b93819edbc0cff7d/maintainability" /></a>

[![Coverage Status](https://coveralls.io/repos/stevenbeales/mental-test/badge.svg?branch=master)](https://coveralls.io/r/stevenbeales/mental-test?branch=master)

[![Dependency Status](https://beta.gemnasium.com/badges/github.com/stevenbeales/mental-test.svg)](https://beta.gemnasium.com/projects/github.com/stevenbeales/mental-test) 

[![Inline docs](http://inch-ci.org/github/stevenbeales/mental-test.svg?branch=master)](http://inch-ci.org/github/stevenbeales/mental-test)

[![license](https://img.shields.io/github/license/mashape/apistatus.svg)](https://opensource.org/licenses/MIT)

An Alexa skill for validated Mental Health Self-Assessments, written in Ruby using the Sinatra and Ralyxa frameworks.

The application supports importing Surveys and Instruments from SurveyJS.io and REDCap.
TODO - The application supports automated scoring of Instruments where applicable.
TODO - The application will direct you to a physician or clinical trial that specializes in your assessed conditions.

Disclaimer. These statements have not been validated by the FDA. THis skill is not intended to diagnose or treat any condition.

To install dependencies -

1) Install Postgres 9.4 or higher. This skill uses Postgres jsonb columns to store indexed unstructured data. 
2) Use bundler - bundle install - to install all other gems from the Gemfile.
3) bundle exec rake db:setup - To generate test and development databases and seed the databases with test data
4) Supports Travis Continuous Integration if you have linked Travis CI and Github accounts.

TO run the test suite -

1) bundle exec rake spec
2) bundle exec rubocop (checks code conforms to style guide)
3) bundle exec rake bundle:audit (checks code and gems for security vulnerabilities)

To generate the skill documentation -

1) rake rdoc 

## Contributing

See the [Contribution Guidelines](https://github.com/stevenbeales/mental-test/blob/master/CONTRIBUTING.md)

### Resources

- [Git Repository](https://github.com/stevenbeales/mental-test)
- [Git Repository Mental-Test Alexa Skill CLI](https://github.com/stevenbeales/mental-health)
- [Git Repository Mental-Test Survey Editor](https://github.com/stevenbeales/mental-editor)
