class AddHasPainToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :has_pain, :boolean
  end
end
