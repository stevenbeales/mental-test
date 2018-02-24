# frozen_string_literal: true

require 'jsonb_accessor'

# Represents a psychometric instrument
# Similar to a survey or questionnaire
class Instrument < ActiveRecord::Base
 
  has_many :assessments, through: :assessment_instruments
  has_many :assessment_instruments
  
  jsonb_accessor :content,
                 title: [:string, default: 'Untitled'],
                 pages: [:jsonb, array: true, default: []]
  
  validates :name, presence: true
  validates_uniqueness_of :name
  validates_length_of :name, \
                      within: 2..50, \
                      too_long: 'pick a shorter name', \
                      too_short: 'pick a longer name'

  after_initialize :items

  def self.list_tests
    Instrument.all.join(' ')
  end

  # Returns an array of Items that represent the questions in an instrument.
  def items
    @items = []
    elements = []
    pages.each { |p| elements += p['elements'] }
    elements.each do |i|
      item = Item.new(i)
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
