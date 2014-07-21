class ChangeDatetimeToTime < ActiveRecord::Migration
  def change
    change_column :alerts, :time, :time
  end
end
