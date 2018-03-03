require 'spec_helper'
require 'singleton'

describe Dry::Config::Base do

  class ComposeConfig < Dry::Config::Base
  end

  subject(:new_compose) { ComposeConfig.new }

  context 'no interpolation' do
    let(:config_file_name) { 'docker-compose-template-simple.yml' }
    subject(:compose) { new_compose}
    before(:each) { FileUtils.rm_r tmp_dir }

    it 'should read file and write file with all values intact' do
      compose.clear
      compose.load!(nil, config_file_name_path)

      expected_config = compose.configuration
      tmp_file = tmp_file(config_file_name.gsub('.', '-out.'))
      compose.write_yaml_file(tmp_file)

      compose.clear
      compose.load!(nil, tmp_file)
      actual_config = compose.configuration

      expect(actual_config).to eq expected_config
    end
  end

  context 'interpolation' do
    let(:config_file_name) { 'docker-compose-template.yml' }
    before(:each) {
      ENV['HOME'] = '/Users/rosskevin'
      ENV['PROJECT_NAME'] = 'acme'
      ENV['BUILD'] = '888'
    }
    subject(:compose) {
      compose = new_compose
      compose.clear
      compose.load!(nil, config_file_name_path)
      compose
    }
    let(:configuration) { compose.configuration }

    it 'parses structure' do
      expect(configuration[:db]).not_to be_nil
    end

    it 'multiple' do
      expect(configuration[:db][:volumes][0]).to eq '/Users/rosskevin/docker/mysql/acme-888:/var/lib/mysql:rw'
    end

    it 'all varieties' do
      interpolations = configuration[:interpolations]
      interpolations.each do |result|
        expect(result).to eq '/Users/rosskevin/foo'
      end
    end

    context 'disabled' do
      subject(:new_compose) {ComposeConfig.new(interpolation: false)}

      it 'parses structure' do
        expect(configuration[:db]).not_to be_nil
      end

      it 'it does not interpolate' do
        expect(configuration[:db][:volumes][0]).to eq '~/docker/mysql/${PROJECT_NAME}-${BUILD}:/var/lib/mysql:rw'
      end
    end
  end


  private

  def config_file_name_path
    File.expand_path("../#{config_file_name}", __FILE__)
  end

  def tmp_file(filename)
    file = File.expand_path(filename, tmp_dir)
    file
  end

  def tmp_dir
    dir = File.expand_path("../.././../../tmp/interpolation", __FILE__)
    FileUtils.mkdir_p(dir) unless File.exists? dir
    dir
  end
end