# frozen_string_literal: true

# Abstract class to hold common methods for our models
class ApplicationRecord < ActiveRecord::Base
  
  self.abstract_class = true
  
  # Redefine equality for Application Records
  # Rather than jus having equal IDs, check that all attributes are equal.
  def ==(other)
    attributes == other.attributes
  end
end
