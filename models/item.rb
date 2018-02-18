class Item
  attr_accessor :name
  attr_accessor :type
  attr_accessor :title
  attr_accessor :choices # array of response options

  def find_choice_by_value(value)
    choice = @choices.find { |i| i["value"] == value}
    choice
  end
end
