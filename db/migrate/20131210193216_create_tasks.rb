class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :description
      t.integer :family_member_id

      t.timestamps
    end
  end
end
