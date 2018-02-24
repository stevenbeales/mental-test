# frozen_string_literal: true

# Represents a psychometric item
# Similar to a question with metadata
class Item
  attr_accessor :name
  attr_accessor :type
  attr_accessor :title
  attr_accessor :choices # array of response options
  attr_accessor :is_required

  def initialize(options = {})
    @name = options['name']
    @type = options['type']
    @title = options['title']
    @is_required = options['isRequired']
    @choices = options['choices']
  end

  def find_choice_by_value(value)
    @choices.find { |i| i['value'] == value }
  end

  def to_s
    name
  end
end
