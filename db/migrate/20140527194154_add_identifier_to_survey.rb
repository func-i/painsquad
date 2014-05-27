class AddIdentifierToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :identifier, :string
  end
end
