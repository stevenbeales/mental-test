# frozen_string_literal: true

# class to implement a friendly exception for file not found rather than ErrNoEnt
class FileNotFoundException < StandardError
  attr_reader :file_name

  def initialize(file_name)
    @file_name = file_name
  end

  def to_s
    "#{I18n.t :file_not_found}: #{file_name}"
  end
end

# class to implement an exception for Missing Table Names in migrations
class MissingTableNameException < StandardError
  attr_reader :table_name

  def initialize(table_name)
    @table_name = table_name
  end

  def to_s
    "#{I18n.t :missing_table_name}: #{table_name}"
  end
end
