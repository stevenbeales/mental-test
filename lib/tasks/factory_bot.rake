# frozen_string_literal: true

namespace :factory_bot do
  desc 'Verify that all FactoryBot factories are valid'
  task :lint do
    if ENV['RACK_ENV'] == 'test'
      FactoryBot.lint
    else
      system("bundle exec rake factory_bot:lint RACK_ENV='test'")
      raise if $CHILD_STATUS.exitstatus.nonzero?
    end
  end
end
