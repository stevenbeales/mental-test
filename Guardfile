# frozen_string_literal: true

# A Guardfile
# More info at https://github.com/guard/guard#readme

# Note: The cmd option is now required due to the increasing number of ways
#       rspec may be run, below are examples of the most common uses.

guard :rspec, cmd: 'bundle exec rspec' do
  require 'guard/rspec/dsl'
  dsl = Guard::RSpec::Dsl.new(self)

  # RSpec files
  rspec = dsl.rspec
  watch(rspec.spec_helper) { rspec.spec_dir }
  watch(rspec.spec_support) { rspec.spec_dir }
  watch(rspec.spec_files)

  # Ruby files
  ruby = dsl.ruby
  dsl.watch_spec_files_for(ruby.lib_files)

  %w[models config db services intents bin public].select do |d| 
    Dir.exist?(d) ? d : UI.warning("Directory #{d} does not exist")
  end
end

guard :rspec, cmd: 'rspec -f html -o ./tmp/spec_results.html', launchy: './tmp/spec_results.html' do
  # ...
end
