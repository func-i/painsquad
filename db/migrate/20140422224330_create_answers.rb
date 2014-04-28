class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :submission
      t.references :choice
      t.references :question
      t.string :custom_text
      t.integer :value
      t.timestamps
    end
  end
end
