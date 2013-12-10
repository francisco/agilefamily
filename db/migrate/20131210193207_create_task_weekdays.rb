class CreateTaskWeekdays < ActiveRecord::Migration
  def change
    create_table :task_weekdays do |t|
      t.integer :task_id
      t.integer :weekday_id

      t.timestamps
    end
  end
end
