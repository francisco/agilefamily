class Task < ActiveRecord::Base
  attr_accessible :description, :family_member_id

  belongs_to :task_log
  belongs_to :family_member
  has_many :task_weekdays
  has_many :week_days, through: :task_weekdays

  validates :description, presence: true
end
