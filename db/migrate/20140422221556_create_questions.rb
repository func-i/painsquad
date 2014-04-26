class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :survey
      t.string :choice_type
      t.string :title
      t.string :tip
      t.timestamps
    end
  end
end