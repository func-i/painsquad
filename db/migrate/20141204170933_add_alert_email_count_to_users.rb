class AddAlertEmailCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :alert_email_count, :integer, default: 0
  end
end
