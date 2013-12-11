require 'spec_helper'

describe TaskWeekday do

  it "should belong to task" do
    task_weekday.should respond_to(:task)
  end

  it "should belong to weekday" do
    task_weekday.should respond_to(:weekday)
  end
end
