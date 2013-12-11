class AddMeetingDayToFamily < ActiveRecord::Migration
  def change
    add_column :families, :meeting_day, :string
  end
end
