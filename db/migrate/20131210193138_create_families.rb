class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.datetime :meeting_day
      t.text :mission_statement
      t.string :name

      t.timestamps
    end
  end
end
