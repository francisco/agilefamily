require 'spec_helper'

describe Task do
self.instance_exec &$test_vars

  it "should belong to family member" do
    task.should respond_to(:family_member_id)
    task.family_member_id.should == family_member1.id
    task.family_member.should == family_member1
  end

  it "should have many task logs" do
    task.should respond_to(:task_logs)
  end

  it "should have many task weekdays" do
    task.should respond_to(:task_weekdays)
  end

  it "should have many week days" do
    task.should respond_to(:week_days)
  end
end
