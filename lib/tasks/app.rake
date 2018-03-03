# frozen_string_literal: true

namespace :app do
  desc 'Run development web server'
  task :run do
    sh %( ruby app.rb)
  end
  
  desc 'push to git'
  task :push do
    sh %( git push -u origin master )
  end

  desc 'run yard server'
  task :doc do
    sh %( yard server )
  end
end
