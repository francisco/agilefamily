class AddCompleteToTaskWeekday < ActiveRecord::Migration
  def change
    add_column :task_weekdays, :complete, :boolean, :default => false
  end
end
