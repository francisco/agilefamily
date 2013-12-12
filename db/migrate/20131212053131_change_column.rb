class ChangeColumn < ActiveRecord::Migration
  change_table :family_members do |t|
    t.change :phone, :string
  end
end
