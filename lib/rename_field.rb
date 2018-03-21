# frozen_string_literal: true

# Helper class to rename columns in CSV files
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
