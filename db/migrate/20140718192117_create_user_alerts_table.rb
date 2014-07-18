class CreateUserAlertsTable < ActiveRecord::Migration
  def change
    create_table :user_alerts do |t|
      t.integer :alert_id
      t.integer :user_id
    end
  end
end
