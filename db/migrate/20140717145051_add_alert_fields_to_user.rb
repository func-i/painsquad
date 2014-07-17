class AddAlertFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :morning_alert, :datetime
    add_column :users, :evening_alert, :datetime
  end
end
