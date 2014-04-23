class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.references :question
      t.string :value
      t.boolean :textfield, default: :false
      t.timestamps
    end
  end
end
