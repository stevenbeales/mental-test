# frozen_string_literal: true

require 'csv'

# Helper class to process CSV files
class CsvSource
  attr_reader :arrays
  attr_reader :file
  
  def initialize(file)
    @file = file
  end
  
  # returns an array of arrays containing file contents
  def read
    raise FileNotFoundException.new I18n.t :file_not_found unless File.exist? file 
 
    @arrays = CSV.read(file)
  end

  # returns a line delimited single string
  def to_s
    read unless arrays
    arrays.map(&:join).join("\n")
  end
end
