class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :submission
      t.references :choice
      t.references :question
      t.text :value
      t.timestamps
    end
    add_index :answers, [:submission_id, :choice_id, :question_id]
  end
end
