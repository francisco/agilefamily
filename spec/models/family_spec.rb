require 'spec_helper'

describe Family do
  self.instance_exec &$test_vars

  it "should have many family members" do
    family.should respond_to(:family_members)
  end

  it "should have many tasks" do
    family.should respond_to(:tasks)
  end
end
