# frozen_string_literal: true

# Module to hold shared class and instance methods
module SharedMethods
  def self.get_test_names(tests)
    tests.join(' ')
  end
end
