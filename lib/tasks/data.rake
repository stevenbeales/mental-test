# frozen_string_literal: true

namespace :data do
  task data_migration_dependencies: :environment do
    require 'nondestructive_migrations'
  end

  desc "run data migration (#{MIGRATIONS_PATH})"
  task migrate: :data_migration_dependencies do
    NondestructiveMigrator.migrate(MIGRATIONS_PATH)
  end

  desc "rollback data migration (#{MIGRATIONS_PATH})"
  task rollback: :data_migration_dependencies do
    step = ENV['STEP'] ? ENV['STEP'].to_i : 1
    NondestructiveMigrator.rollback(MIGRATIONS_PATH, step)
  end

  namespace :migrate do
    desc 'runs the "up" for a given _data_ migration VERSION'
    task up: :data_migration_dependencies do
      version = ENV["VERSION"] ? ENV["VERSION"].to_i : nil
      raise "VERSION is required" unless version
      NondestructiveMigrator.run(:up, MIGRATIONS_PATH, version)
    end

    desc 'runs the "down" for a given _data_ migration VERSION'
    task down: :data_migration_dependencies do
      version = ENV["VERSION"] ? ENV["VERSION"].to_i : nil
      raise "VERSION is required" unless version
      NondestructiveMigrator.run(:down, MIGRATIONS_PATH, version)
    end
  end
end
