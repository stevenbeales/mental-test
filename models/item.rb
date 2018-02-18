class Item
  attr_accessor :name
  attr_accessor :type
  attr_accessor :title
  attr_accessor :choices #array of response options

  def choices
  
  end

  def initialize
    @choices = []
  end
end