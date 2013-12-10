class TaskWeekday < ActiveRecord::Base
  attr_accessible :task_id, :weekday_id

  belongs_to :task
  belongs_to :weekday
end
