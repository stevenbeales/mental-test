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
  add_filter '/public/'
  add_filter '/vendor/'
  add_filter '/log/'
  add_filter ['Gemfile.lock', 'README.md', 'todo.txt', '.gitignore', '.rspec', 
              '.travis.yml', '.rubocop.yml', 'config/database.yml', 
              'Guardfile', 'Rakefile', '_config.yml', '.coveralls.yml', '.env',
              '.scrutinizer.yml', '.ruby-version', '.test.env', 'CODE_OF_CONDUCT.md',
              'AUTHORS', '.rdoc_options', '.inch.yml', 'CONTRIBUTING.md', 'issue_template.md',
              'LICENSE', 'Gemfile'
            ] 
end
