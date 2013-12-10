class Weekday < ActiveRecord::Base
  attr_accessible :weekday

  validates_inclusion_of :weekday, :in => %w(monday, tuesday, wednesday, thursday, friday, saturday, sunday)
    :message => "{{value}} is not a valid day"
end
