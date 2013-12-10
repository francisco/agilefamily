class CreateFamilyMembers < ActiveRecord::Migration
  def change
    create_table :family_members do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.integer :age
      t.integer :family_id
      t.string :role

      t.timestamps
    end
  end
end
