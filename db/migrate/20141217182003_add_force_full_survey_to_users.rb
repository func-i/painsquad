class AddForceFullSurveyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :force_full_survey, :boolean, default: false
  end
end
