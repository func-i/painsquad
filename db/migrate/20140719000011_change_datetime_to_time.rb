class ChangeDatetimeToTime < ActiveRecord::Migration
  def change
    change_columns :alerts, :time, :time
  end
end
