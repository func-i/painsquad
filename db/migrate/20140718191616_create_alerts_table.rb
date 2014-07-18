class CreateAlertsTable < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.datetime :time
      t.string :display_time
      t.string :category
      t.timestamps
    end
  end
end
