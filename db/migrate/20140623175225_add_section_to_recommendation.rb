class AddSectionToRecommendation < ActiveRecord::Migration
  def change
    add_column :recommendations, :section, :string
  end
end
