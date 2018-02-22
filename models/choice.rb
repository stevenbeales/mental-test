# frozen_string_literal: true

# Represents a single option in a multi-choice item
class Choice
  attr_accessor :value
  attr_accessor :text

  def to_s
    value + ' ' + text
  end
end
