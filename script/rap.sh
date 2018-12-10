#!/bin/bash
bundle exec rake spec && git add . && git commit -m $1 && bundle exec rake app:push
