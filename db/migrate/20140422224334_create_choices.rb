class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.references :question
      t.boolean :textfield, default: :false
      t.string :content
      t.string :value
      t.string :custom_text
      t.timestamps
    end
  end
end
