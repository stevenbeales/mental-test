require 'jsonb_accessor'

class Instrument < ActiveRecord::Base
  validates :name, presence: true
  validates_uniqueness_of :name

  jsonb_accessor :content,
                 title: [:string, default: 'Untitled'],
                 pages: [:jsonb, array: true, default: []]
  after_initialize :items

  # Returns an array of Items that represent the questions in an instrument.
  def items
    @items = []
    elements = []
    pages.each { |p| elements += p['elements'] }
    elements.each do |i|
      item = Item.new
      item.name = i['name']
      item.type = i['type']
      item.title = i['title']
      item.isRequired = i['isRequired']
      item.choices = i['choices']
      @items << item
    end
    @items
  end

  def find_item_by_name(name)
    item = @items.find { |i| i.name == name}
    item
  end
end
