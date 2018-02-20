class Item
  attr_accessor :name
  attr_accessor :type
  attr_accessor :title
  attr_accessor :choices # array of response options
  attr_accessor :isRequired

  def find_choice_by_value(value)
    @choices.find { |i| i['value'] == value }
  end

  def initialize
    @choices = []
  end

  def to_s
    name
  end

  # create an item from a hash
  def self.create_item(h)
    item = Item.new
    item.name = h['name']
    item.type = h['type']
    item.title = h['title']
    item.isRequired = h['isRequired']
    item.choices = h['choices']
    item
  end
end
