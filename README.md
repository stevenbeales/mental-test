[![Build Status](https://travis-ci.org/stevenbeales/mental-test.png)](https://travis-ci.org/stevenbeales/mental-test)

<a href="https://codeclimate.com/github/stevenbeales/mental-test/maintainability"><img src="https://api.codeclimate.com/v1/badges/6574b93819edbc0cff7d/maintainability" /></a>

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

