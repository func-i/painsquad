class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :submission
      t.references :choice
      t.string :content
      t.timestamps
    end
  end
end
