require 'jsonb_accessor'

class Instrument < ActiveRecord::Base
  validates_uniqueness_of :name
  jsonb_accessor :content,
    title: [:string, default: "Untitled"],
    pages: [:jsonb, array: true, default: []]
  after_initialize :items


  #Returns an array of Items that represent the questions in an instrument.
  def items
    @items = []
    elements = []
    pages.each {|p| elements += p["elements"]}
    elements.each do |i|
      item = Item.new
      item.name = i["name"]
      item.type = i["type"]
      item.title = i["title"]
      @items << item
    end
    @items
  end
end