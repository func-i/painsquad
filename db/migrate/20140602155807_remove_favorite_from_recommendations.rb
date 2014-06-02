class RemoveFavoriteFromRecommendations < ActiveRecord::Migration
  def change
    remove_column :recommendations, :favorite
  end
end
