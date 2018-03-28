# frozen_string_literal: true

# Abstract class to hold common methods for application models
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  # Redefine equality for application records
  # Rather than just checking for equal IDs, check that all attributes are equal.
  def ==(other)
    return attributes == other.attributes if other
  end
end
