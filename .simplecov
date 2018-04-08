SimpleCov.profiles.define 'app' do
  add_group 'Models', 'app/models'
  add_group 'Services', 'app/services'
  add_group 'Intents', 'intents'
  add_group 'Lib', 'lib'
  add_group 'Config', 'config'
  add_group 'Db', 'db'
  add_group 'Spec', 'spec'
  
  add_filter '/.bundle/'
  add_filter '/.vscode/'
  add_filter '/bin/'
  add_filter '/coverage/'
  add_filter '/doc/'
  add_filter '/tmp/'
  add_filter '/script/'
  add_filter '/public/'
  add_filter '/vendor/'
  add_filter '/log/'
  add_filter ['_config.yml', '.codeclimate.yml', '.coveralls.yml', '.env', '.fasterer.yml', '.gitattributes',
              '.gitignore', '.inch.yml', '.overcommit.yml', '.rdoc_options',  '.rspec', '.rubocop.yml',
              '.ruby-version', '.scrutinizer.yml', '.simplecov', '.test.env', '.travis.yml', 'app.json',
              'AUTHORS', 'CODE_OF_CONDUCT.md', 'config.reek', 'CONTRIBUTING.md', '.development.env', 'Gemfile',
              'Gemfile.lock', 'Guardfile', 'heroku.yml', 'issue_template.md', 'LICENSE', 'Procfile', '.production.env',
               'Rakefile', 'README.md', 'todo.txt', 'VERSION', 'config/database.yml'
            ] 
end
