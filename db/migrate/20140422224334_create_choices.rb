class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.references :question
      t.boolean :textfield, default: :false
      t.string :content
      t.integer :value
      t.timestamps
    end
  end
end
