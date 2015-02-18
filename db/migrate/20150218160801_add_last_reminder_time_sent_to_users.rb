class AddLastReminderTimeSentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_reminder_time, :datetime
  end
end
