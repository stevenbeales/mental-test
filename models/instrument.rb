# frozen_string_literal: true

require 'jsonb_accessor'
require './lib/shared_methods'

# Represents a psychometric instrument
# Similar to a survey or questionnaire
class Instrument < ActiveRecord::Base
  extend SharedMethods

  belongs_to :assessment
  
  jsonb_accessor :content,
                 title: [:string, default: 'Untitled'],
                 pages: [:jsonb, array: true, default: []]
  
  validates :name, presence: true
  validates_uniqueness_of :name
  
  after_initialize :items

  def self.list_tests
    get_test_names(Instrument.all)
  end

  def self.get_test_names(tests)
    tests.join(' ')
  end

  # Returns an array of Items that represent the questions in an instrument.
  def items
    @items = []
    elements = []
    pages.each { |p| elements += p['elements'] }
    elements.each do |i|
      item = Item.create_item(i)
      @items << item
    end
    @items
  end

  def find_item_by_name(name)
    @items.find { |i| i.name == name }
  end

  def to_s
    name
  end
end
