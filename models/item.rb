# frozen_string_literal: true

# Represents a psychometric item
# Similar to a question with metadata
class Item
  attr_accessor :name
  attr_accessor :type
  attr_accessor :title
  attr_accessor :choices # array of response options
  attr_accessor :isRequired

  # create an item from a hash
  def self.create_item(options={})
    item = Item.new
    item.name = options['name']
    item.type = options['type']
    item.title = options['title']
    item.isRequired = options['isRequired']
    item.choices = options['choices']
    item
  end

  def initialize(options={})
    @choices = []
  end

  def find_choice_by_value(value)
    @choices.find { |i| i['value'] == value }
  end

  def to_s
    name
  end
end
