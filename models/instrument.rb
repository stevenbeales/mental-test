# frozen_string_literal: true

# == Schema Information
#
# Table name: instruments
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  content    :jsonb            not null
#  created_at :datetime         default(2018-02-23 00:00:00 UTC), not null
#  updated_at :datetime         default(2018-02-23 00:00:00 UTC), not null

require 'jsonb_accessor'

# Represents a psychometric instrument
# Similar to a survey or questionnaire
class Instrument < ActiveRecord::Base
  # has_paper_trail

  has_many :assessments, through: :assessment_instruments
  has_many :assessment_instruments, inverse_of: :instrument
  
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
    @items = elements.map { |e| Item.new(e) }
  end

  def find_item_by_name(name)
    @items.find { |i| i.name == name }
  end

  def to_s
    name
  end
end
