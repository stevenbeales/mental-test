# frozen_string_literal: true

# Represents a psychometric instrument
# Similar to a survey or questionnaire
class Instrument < ApplicationRecord
  include PgSearch
  multisearchable against: %i[json_content csv_content]
  pg_search_scope :search_json, against: :json_content
  pg_search_scope :search_csv, against: :csv_content
  
  has_many :assessment_instruments, inverse_of: :instrument, dependent: :destroy
  has_many :study_event_instruments, inverse_of: :instrument, dependent: :destroy
  has_many :assessments, inverse_of: :instrument, through: :assessment_instruments
  has_many :study_events, inverse_of: :instrument, through: :study_event_instruments
  has_many :items, inverse_of: :instrument, dependent: :destroy
  
  jsonb_accessor :json_content,
                 title: [:string, default: 'Untitled'],
                 pages: [:jsonb, array: true, default: []]

  validates :name, presence: true
  validates_uniqueness_of :name
  validates_length_of :name, \
                      within: 2..50, \
                      too_long: 'pick a shorter name', \
                      too_short: 'pick a longer name'
 
  def self.list_tests(limit: 4)
    Instrument.order(:name).limit(limit).join(' ')
  end

  def to_s
    name
  end
end
