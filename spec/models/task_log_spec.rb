require 'spec_helper'

describe TaskLog do
 self.instance_exec &$test_vars

  it "should belong to family member" do
    task_log.should respond_to(:task)
  end

  it "should belong to family member" do
    task_log.should respond_to(:family_member)
  end
end
