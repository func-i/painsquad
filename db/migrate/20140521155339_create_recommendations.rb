class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.references :advice
      t.string :title
      t.string :image
      t.string :duration
      t.string :context
      t.boolean :favorite, default: false
      t.timestamps
    end
  end
end