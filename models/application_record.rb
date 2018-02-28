# frozen_string_literal: true

# Abstract class to hold common methods for our models
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def ==(other)
    attributes == other.attributes
  end
end
