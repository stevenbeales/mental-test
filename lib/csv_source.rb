# frozen_string_literal: true

require 'csv'

# Helper class to process CSV files
class CsvSource
  def initialize(file, options)
    @file = file
    @options = options
  end
  
  def each
    CSV.foreach(@file, @options) do |row|
      yield row.to_hash
    end
  end
end
