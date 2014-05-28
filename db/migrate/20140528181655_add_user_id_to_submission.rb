class AddUserIdToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :user_id, :integer
    add_column :submissions, :pain_severity, :integer
  end
end
