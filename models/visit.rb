# frozen_string_literal: true

# == Schema Information
#
# Table name: visits
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  name       :string           default("2018-02-26 15:05:06.484447"), not null
#  visit_date :datetime         default(2018-02-26 15:05:06 UTC), not null
#  created_at :datetime         default(2018-02-26 15:05:06 UTC), not null
#  updated_at :datetime         default(2018-02-26 15:05:06 UTC), not null
#

# Model to represent a user visit or an attempt in a self assessment
class Visit < ActiveRecord::Base
  belongs_to :user, inverse_of: :visits 
  belongs_to :survey, inverse_of: :visits 
  has_many :assessments, dependent: :destroy
  validates :user, presence: true
  validates :survey, presence: true
  validates_uniqueness_of :name, scope: %i[survey user] 
end
