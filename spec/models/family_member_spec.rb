require 'spec_helper'

describe FamilyMember do
  self.instance_exec &$test_vars

  it "should belong to a family" do
    family_member = FamilyMember.create(age: 10, family_id: 1, name: "Test")
    family_member.should respond_to(:family)
  end

  it "should have many tasks" do
    family_member = FamilyMember.create(age: 10, family_id: 1, name: "Test")
    family_member.should respond_to(:tasks)
  end

  it "should have many task logs" do
    family_member = FamilyMember.create(age: 10, family_id: 1, name: "Test")
    family_member.should respond_to(:task_logs)
  end
end
