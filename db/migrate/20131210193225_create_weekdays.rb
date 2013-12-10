class CreateWeekdays < ActiveRecord::Migration
  def change
    create_table :weekdays do |t|
      t.string :weekday

      t.timestamps
    end
  end
end
