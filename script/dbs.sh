#!/bin/bash
bundle exec rake db:remove_schema && bundle exec rake db:recreate
