class CreateRecommendationFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user
      t.references :recommendation

      t.timestamps
    end
  end
end
