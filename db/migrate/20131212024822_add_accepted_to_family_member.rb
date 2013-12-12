class AddAcceptedToFamilyMember < ActiveRecord::Migration
  def change
    add_column :family_members, :accepted, :boolean
  end
end
