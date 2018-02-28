# frozen_string_literal: true

require './lib/app_constants'

# Abstract class to hold common methods for our models
class ApplicationRecord < ActiveRecord::Base
  include AppConstants
  
  self.abstract_class = true
  
  def ==(other)
    attributes == other.attributes
  end
end
