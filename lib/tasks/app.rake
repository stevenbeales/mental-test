# frozen_string_literal: true

namespace :app do
  desc 'Run development web server'
  task :run do
    sh %( bundle exec rackup)
  end

  desc 'push to git'
  task :push do
    sh %( git push -u origin master )
  end

  desc 'run rubocop'
  task :cop do
    sh %( 'rubocop' )
  end
end
