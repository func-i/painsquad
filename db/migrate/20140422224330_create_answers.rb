class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :submission
      t.references :choice
      t.references :question
      t.text :value
      t.timestamps
    end
  end
end
