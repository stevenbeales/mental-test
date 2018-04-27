# frozen_string_literal: true

# Represents a psychometric instrument
# Similar to a survey or questionnaire
class Instrument < ApplicationRecord
  audited
  include PgSearch
  include Discard::Model
  multisearchable against: %i[json_content csv_content]
  pg_search_scope :search_json, against: :json_content
  pg_search_scope :search_csv, against: :csv_content

  default_value_for :version_number, '1.0'
  default_value_for :instrument_type, 'json'

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
  validates :version_number, presence: true
  validates_uniqueness_of :version_number, scope: :name

  validates :instrument_type, presence: true
  validates :instructions, presence: true, allow_blank: true
  validates :json_content, presence: true
  validates :csv_content, presence: true, allow_blank: true

  def self.list_tests(limit: 4)
    Instrument.order(:name).limit(limit).join(' ')
  end

  def to_s
    name
  end

  def first_question_and_instructions
    %(#{instructions} #{items.first.title})
  end
end

# == Schema Information
#
# Table name: instruments
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  version_number  :string           default("1.0"), not null
#  instrument_type :string           default("json"), not null
#  json_content    :jsonb            not null
#  csv_content     :text             default(""), not null
#  instructions    :text             default(""), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  tags            :string           default([]), is an Array
#
# Indexes
#
#  index_instruments_on_csv_content  (csv_content)
#  index_instruments_on_name         (name) UNIQUE
#  instrument_json_content           (json_content)
#  instrument_tags                   (tags)
#
