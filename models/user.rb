class User < ActiveRecord::Base
  validates :username, presence: true
  validates_uniqueness_of :username

  def to_s
    username
  end
end
