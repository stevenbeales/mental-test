require 'spec_helper'
require 'singleton'

describe Dry::Config::Base do

  class DockerRailsConfig < Dry::Config::Base
    def initialize(options = {})
      options = {
          default_configuration: {
              verbose: false

          }
      # ,
      #     prune: [:development, :test, :parallel_tests, :staging, :production]
      }.merge(options)

      super(options)
    end
  end
  
  subject(:config) { DockerRailsConfig.new }
  before(:each) {
    config.clear
  }

  it 'should deep merge a subordinate array' do

    config.load!(:development, config_file_path)

    links = config[:'docker-compose'][:web][:links]
    expect(links).to match_array %w(elasticsearch db)

    # ensure no unnecessary environments make it into the resolved configuration
    expect(config.production).to be_nil
  end

  private

  def config_file_path
    File.expand_path('../docker-rails.yml', __FILE__)
  end
end