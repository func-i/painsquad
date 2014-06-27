class AddTagToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :tag, :string
    add_column :questions, :report_label, :string
  end
end
