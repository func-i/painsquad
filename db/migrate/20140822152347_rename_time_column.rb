class RenameTimeColumn < ActiveRecord::Migration
  def change
    rename_column :alerts, :time, :alert_time
  end
end
