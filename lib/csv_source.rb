# frozen_string_literal: true

require 'csv'

# Helper class to process CSV files
class CsvSource
  attr_reader :arrays
  
  def initialize(file, options)
    @file = file
    @options = options
  end
  
  def each
    CSV.foreach(@file, @options) do |row|
      yield row.to_hash
    end
  end

  # returns an array of arrays containing file contents
  def read
    @arrays = CSV.read(@file)
  end

  # returns a line delimited single string
  def to_s
    read unless arrays
    arrays.map(&:join).join("\n")
  end
end
