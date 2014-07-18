class RemoveAlertsFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :morning_alert
    remove_column :users, :evening_alert
  end
end
