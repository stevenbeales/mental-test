# frozen_string_literal: true

# Helper class to rename columns in Csv file
class RenameField
  def initialize(from:, dest:)
    @from = from
    @dest = dest
  end
  
  def process(row)
    row[@dest] = row.delete(@from)
    row
  end
end
