class AddSectionToRecommendation < ActiveRecord::Migration
  def change
    add_column :recommendations, :section, :string
    add_column :recommendations, :group, :string
    remove_column :recommendations, :advice_id
    change_column :recommendations, :description, :text
    change_column :recommendations, :byline, :text
    add_column :steps, :image_path, :string
    change_column :steps, :content, :text
  end
end
