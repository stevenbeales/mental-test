# frozen_string_literal: true

# Model to represent projects
class Project < ApplicationRecord
  enum status: %i[development production inactive archived]

  belongs_to :folder, inverse_of: :projects, optional: true

  scope :active, -> { where(status: [:production]) }

  validates :name, presence: true
  validates :title, presence: true
  validates_uniqueness_of :name
  validates_length_of :name, \
                      within: 2..50, \
                      too_long: 'pick a shorter name', \
                      too_short: 'pick a longer name'

  def self.list_active_projects
    Project.active.join(' ')
  end

  def to_s
    name
  end
end

# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  folder_id    :integer
#  title        :string           not null
#  purpose      :text
#  irb_number   :string
#  grant_number :string
#  pi_firstname :string
#  pi_lastname  :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  status       :integer          default("development")
#
# Indexes
#
#  index_projects_on_folder_id  (folder_id)
#  index_projects_on_name       (name) UNIQUE
#
