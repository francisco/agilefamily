class TaskLog < ActiveRecord::Base
  attr_accessible :complete, :due_date, :family_member_id, :task_id

  belongs_to :family_member
  has_one :task

  validates :due_date, presence: true
end
