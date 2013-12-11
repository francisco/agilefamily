class AddTimeToFamily < ActiveRecord::Migration
  def change
    add_column :families, :meeting_time, :time
  end
end
