# frozen_string_literal: true

# class to implement friendly exception for file not found rather than ErrNoEnt
class FileNotFoundException < StandardError
  def to_s
    'File not found'
  end
end
