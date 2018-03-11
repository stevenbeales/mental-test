# frozen_string_literal: true

namespace :db do
  desc 'Drop, create, migrate then seed the development database'
  task recreate: ['db:drop', 'db:create', 'db:migrate', 'db:seed'] do
    puts 'Reseeding completed.'
  end
end
