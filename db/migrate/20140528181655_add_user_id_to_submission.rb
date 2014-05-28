class AddUserIdToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :user_id, :integer
    add_column :submissions, :report_id, :integer
  end
end
