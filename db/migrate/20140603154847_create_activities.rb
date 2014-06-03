class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :user
      t.integer :subject_id, null: false
      t.string :subject_type, null: false
      t.string :name
      t.string :event

      t.timestamps
    end

    add_index :activities, :subject_id
    add_index :activities, :subject_type
    add_index :activities, :user_id
  end
end
