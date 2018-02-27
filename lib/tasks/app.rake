# frozen_string_literal: true

namespace :mental do
  desc 'Run development web server'
  task :run do
    sh %( rerun -- rackup --port --no-notify 4000 RACK_ENV=development config.ru )
  end
  
  desc 'Make rspec work like autotest'
  task :autospec do
    sh %( rerun -cx rspec )
  end

  desc 'annotate models'
  task :doc do
    sh %( annotate --model-dir=./models )
  end

  desc 'push to git'
  task :git do
    sh %( git push -u origin master )
  end
end
