class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :user
      t.references :submission
      t.boolean :has_pain
      t.integer :pain_severity

      t.timestamps
    end
  end
end
