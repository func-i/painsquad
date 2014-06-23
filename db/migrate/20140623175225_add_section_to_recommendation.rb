class AddSectionToRecommendation < ActiveRecord::Migration
  def change
    add_column :recommendations, :section, :string
    add_column :recommendations, :group, :string
    remove_column :recommendations, :advice_id
  end
end
