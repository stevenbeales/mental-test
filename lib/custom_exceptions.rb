# frozen_string_literal: true

# class to implement a friendly exception for file not found rather than ErrNoEnt
class FileNotFoundException < StandardError
  def to_s
    'File not found'
  end
end

# class to implement an exception for Missing Table Names in migrations
class MissingTableNameException < StandardError
  def to_s
    'Missing Table Name'
  end
end
