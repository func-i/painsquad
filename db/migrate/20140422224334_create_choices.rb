class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.references :question
      t.boolean :textfield, default: :false
      t.string :content
      t.string :value
      t.timestamps
    end
    add_index :choices, :question_id
  end
end
