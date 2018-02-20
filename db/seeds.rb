# frozen_string_literal: true

['all', ENV['RACK_ENV']].each do |seed|
  seed_file = "./db/seeds/#{seed}.rb"
  if File.exist?(seed_file)
    puts "*** Loading #{seed} seed data"
    require seed_file
  end
end
