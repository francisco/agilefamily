class Family < ActiveRecord::Base
  attr_accessible :meeting_day, :mission_statement, :name

  has_many :family_members
  has_many :tasks, through: :family_members

  validates :name, presence: true
  validates :mission_statement, presence: true
  validates :meeting_day, presence: true
end
