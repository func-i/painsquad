class AddModifierToQuestionForDifferentContent < ActiveRecord::Migration
  def change
    add_column :questions, :extremes, :string
  end
end
