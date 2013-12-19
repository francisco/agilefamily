class Task < ActiveRecord::Base
  attr_accessible :description, :family_member_id, :complete

  belongs_to :task_log
  belongs_to :family_member
  has_many :task_weekdays, dependent: :destroy
  has_many :weekdays, through: :task_weekdays

  validates :description, presence: true
end
