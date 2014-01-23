class Task < ActiveRecord::Base
  attr_accessible :description, :family_member_id, :complete

  belongs_to :task_log
  belongs_to :family_member
  has_many :task_weekdays, dependent: :destroy
  has_many :weekdays, through: :task_weekdays

  validates :description, presence: true

  def addTasks(ajaxResponse)
    #numbers correspond to days of the week starting with Monday, which equals 1
    ajaxResponse[0].each_pair{ |x, y|
      x == "1" && y == "true" ? weekdays << Weekday.find_by_weekday("1") : nil
      x == "2" && y == "true" ? weekdays << Weekday.find_by_weekday("2") : nil
      x == "3" && y == "true" ? weekdays << Weekday.find_by_weekday("3") : nil
      x == "4" && y == "true" ? weekdays << Weekday.find_by_weekday("4") : nil
      x == "5" && y == "true" ? weekdays << Weekday.find_by_weekday("5") : nil
      x == "6" && y == "true" ? weekdays << Weekday.find_by_weekday("6") : nil
      x == "7" && y == "true" ? weekdays << Weekday.find_by_weekday("7") : nil
    }
  end
end
