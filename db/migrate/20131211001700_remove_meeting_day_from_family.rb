class RemoveMeetingDayFromFamily < ActiveRecord::Migration
  def up
    remove_column :families, :meeting_day
  end

  def down
    add_column :families, :meeting_day, :datetime
  end
end
