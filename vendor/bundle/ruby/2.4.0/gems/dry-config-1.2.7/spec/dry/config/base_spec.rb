require 'spec_helper'
require 'singleton'

describe Dry::Config::Base do

  class AcmeConfig < Dry::Config::Base
    def initialize(options = {})
      options = {
          # seed the sensible defaults here (overridable)
          default_configuration: {
              environment: nil,
              strategy: :blue_green,
              package: {
                  verbose: false
              },
              options: {}
          }}.merge(options)

      super(options)
    end
  end

  class SingletonAcmeConfig < AcmeConfig
    include Singleton
  end

  subject(:acmeConfig) { AcmeConfig.new }
  before(:each) {
    acmeConfig.clear
  }

  it 'should work as a singleton' do
    expect(SingletonAcmeConfig.instance).to equal(SingletonAcmeConfig.instance)
  end

  it 'should not raise error when key is not found' do
    expect(acmeConfig.app).to be_nil
  end

  it 'should provide seed configuration' do
    assert_common_seed_settings
    expect(acmeConfig.options.length).to eql 0

    # ensure no unnecessary environments make it into the resolved configuration
    expect(acmeConfig.development).to be_nil
    expect(acmeConfig.production).to be_nil
  end

  context 'hash delegation' do
    it 'manupulated delegated methods setter/getter/include?' do
      acmeConfig.load!(nil, config_file_path)
      expect(acmeConfig.symbolize?).to be_truthy

      acmeConfig['foo'] = 'bar'
      expect(acmeConfig.configuration['foo']).to be_nil # no symbolization manipulation to key on direct access to underlying hash
      expect(acmeConfig['foo']).to eq 'bar' # symbolization manipulation of key based on options

      expect(acmeConfig.configuration[:foo]).to eq 'bar' # setter symbolizes, this works
      expect(acmeConfig[:foo]).to eq 'bar'

      expect(acmeConfig.include? 'foo').to be_truthy
      expect(acmeConfig.include? :foo).to be_truthy
    end

    it 'direct delegation' do

      acmeConfig.load!(nil, config_file_path)
      expect(acmeConfig.symbolize?).to be_truthy

      expect(acmeConfig.respond_to? :each_key).to be_truthy
      expect(acmeConfig.respond_to? :each_value).to be_truthy
      expect(acmeConfig.respond_to? :each_pair).to be_truthy
      expect(acmeConfig.respond_to? :each).to be_truthy
      expect(acmeConfig.respond_to? :keys).to be_truthy
      expect(acmeConfig.respond_to? :values).to be_truthy

      # acmeConfig.each_key { |key| puts key }
    end
  end

  it 'to_yaml sub context' do
    acmeConfig.load!(nil, config_file_path)
    expect(acmeConfig.symbolize?).to be_truthy
    expect(acmeConfig.unsymbolize_to_yaml?).to be_truthy

    yaml = acmeConfig.to_yaml(acmeConfig[:options])
    # puts yaml
    expect(yaml =~ /^---\naws\:elasticbeanstalk\:application\:environment\:$/).to be_truthy
  end

  context 'unsymbolize_to_yaml' do
    it 'defaults to unsymbolized' do
      acmeConfig.load!(nil, config_file_path)
      expect(acmeConfig.symbolize?).to be_truthy
      expect(acmeConfig.unsymbolize_to_yaml?).to be_truthy

      yaml = acmeConfig.to_yaml
      # puts yaml
      expect(yaml =~ /\:app\:/).to be_falsey
      expect(yaml =~ /app\:/).to be_truthy

      expect(yaml =~ /\:strategy\:/).to be_falsey
      expect(yaml =~ /strategy\:/).to be_truthy
    end

    context 'symbolize: false' do
      subject(:acmeConfig) { AcmeConfig.new(unsymbolize_to_yaml: false) }

      it 'should leave keys symbolized' do
        acmeConfig.load!(nil, config_file_path)
        expect(acmeConfig.symbolize?).to be_truthy
        expect(acmeConfig.unsymbolize_to_yaml?).to be_falsey

        yaml = acmeConfig.to_yaml
        # puts yaml
        expect(yaml =~ /\:app\:/).to be_truthy
        expect(yaml =~ /\:strategy\:/).to be_truthy
      end
    end
  end

  context 'when loading a single configuration file' do

    it 'should read file with nil environment' do

      acmeConfig.load!(nil, config_file_path)

      assert_common_seed_settings
      assert_common_top_level_settings

      assert_option :'aws:elasticbeanstalk:application:environment', :RAILS_ENV, 'foobar'
      assert_option :'aws:autoscaling:launchconfiguration', :InstanceType, 'foo'

      # ensure no unnecessary environments make it into the resolved configuration
      expect(acmeConfig.development).to be_nil
      expect(acmeConfig.production).to be_nil
    end

    it 'should override with development environment' do

      acmeConfig.load!(:development, config_file_path)

      # assert_common_seed_settings
      assert_common_top_level_settings

      assert_option :'aws:elasticbeanstalk:application:environment', :RAILS_ENV, 'development'
      assert_option :'aws:autoscaling:launchconfiguration', :InstanceType, 't1.micro'

      expect(acmeConfig.package[:verbose]).to eql true
      expect(acmeConfig.strategy).to eql 'inplace-update'

      # ensure no unnecessary environments make it into the resolved configuration
      expect(acmeConfig.production).to be_nil
    end

    it 'should override with production environment' do

      acmeConfig.load!(:production, config_file_path)

      # assert_common_seed_settings
      assert_common_top_level_settings

      assert_option :'aws:elasticbeanstalk:application:environment', :RAILS_ENV, 'production'
      assert_option :'aws:autoscaling:launchconfiguration', :InstanceType, 't1.large'

      expect(acmeConfig.package[:verbose]).to eql false

      # seed values
      expect(acmeConfig.strategy).to eql :blue_green
      expect(acmeConfig.package[:verbose]).to eql false

      # ensure no unnecessary environments make it into the resolved configuration
      expect(acmeConfig.development).to be_nil
    end
  end
  private

  def assert_option(section, name, value)
    expect(acmeConfig.options[section][name]).to eql value
  end


  def assert_common_seed_settings
    expect(acmeConfig.strategy).to eql :blue_green
    expect(acmeConfig.environment).to be_nil
    expect(acmeConfig.package[:verbose]).to eql false
    expect(acmeConfig.options).not_to be_nil
  end

  def assert_common_top_level_settings
    expect(acmeConfig.app).to eql 'acme'
    expect(acmeConfig.title).to eql 'Acme Holdings, LLC'
  end

  def config_file_path
    File.expand_path('../acme.yml', __FILE__)
  end

  context 'white label' do
    class WhiteLabelConfig < Dry::Config::Base
    end

    subject(:white_label_config) { WhiteLabelConfig.new }

    it 'should read the base white_label_config ' do
      white_label_config.clear
      white_label_config.load!(nil, base_file_path)

      expect(white_label_config.domain).to eql '<undefined>'
      expect(white_label_config.title).to eql '<undefined2>'
      expect(white_label_config.layouts[:app]).to eql '<undefined3>'
      expect(white_label_config.layouts[:public]).to eql '<undefined4>'
      expect(white_label_config.features[:scheduling]).to eql true
    end

    it 'should read the scheduling.acme.com white_label_config ' do
      white_label_config.clear
      white_label_config.load!(nil, base_file_path, acme_file_path, scheduling_acme_file_path)

      expect(white_label_config.domain).to eql 'scheduling.acme.com'
      expect(white_label_config.title).to eql 'Acme Industries Limited, Inc.'
      expect(white_label_config.layouts[:app]).to eql 'layouts/scheduling_app.haml'
      expect(white_label_config.layouts[:public]).to eql 'layouts/public.haml'
      expect(white_label_config.features[:scheduling]).to eql 8
    end

    def base_file_path
      File.expand_path('../white-label/base.yml', __FILE__)
    end

    def acme_file_path
      File.expand_path('../white-label/acme.com.yml', __FILE__)
    end

    def scheduling_acme_file_path
      File.expand_path('../white-label/scheduling.acme.com.yml', __FILE__)
    end
  end
end