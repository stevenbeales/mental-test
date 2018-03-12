# frozen_string_literal: true

namespace :db do
  desc 'Drop, create, migrate then seed the development database'
  task recreate: ['db:drop', 'db:create', 'db:migrate', 'db:seed'] do
    puts 'Reseeding completed.'
  end

  desc 'Remove schema.rb'
  task remove_schema: [] do
    File.delete('./../../db/schema.rb') if File.exist? './../../db/schema.rb'
    puts 'Completed.'
  end
end
