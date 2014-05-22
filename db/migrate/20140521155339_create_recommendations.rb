class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.references :advice
      t.string :title
      t.string :image
      t.string :duration
      t.string :context
      t.string :description
      t.string :byline
      t.string :style
      t.boolean :favorite, default: false

      # t.integer :nested_recommendation_id
      t.timestamps
    end
  end
end
