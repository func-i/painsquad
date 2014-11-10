class AddSuggestableToRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :suggestable, :boolean, default: true
  end
end
