# frozen_string_literal: true

require 'simplecov'
require 'simplecov-console'
require 'scrutinizer/ocular'
require 'scrutinizer/ocular/formatter'
require 'coveralls'

Coveralls.wear!
Scrutinizer::Ocular.watch! 'app'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [
    SimpleCov::Formatter::Console,
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter,
    Scrutinizer::Ocular::UploadingFormatter
  ]
)

SimpleCov.start 'app' do
  track_files 'app.rb'
end
