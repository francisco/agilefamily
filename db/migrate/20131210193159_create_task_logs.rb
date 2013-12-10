class CreateTaskLogs < ActiveRecord::Migration
  def change
    create_table :task_logs do |t|
      t.integer :family_member_id
      t.integer :task_id
      t.datetime :due_date
      t.boolean :complete

      t.timestamps
    end
  end
end
