# frozen_string_literal: true

require 'facets/kernel/blank'

# Helper class to verify presence of expected fields
class VerifyFieldsPresence
  def initialize(expected_fields)
    @expected_fields = expected_fields
  end
  
  def process(row)
    @expected_fields.each do |field|
      raise "Row lacks value for field #{field} - #{row.inspect}" if row[field].blank?
    end
    row
  end
end
