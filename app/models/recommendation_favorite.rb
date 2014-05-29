# == Schema Information
#
# Table name: recommendation_favorites
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  recommendation_id :integer
#  created_at        :datetime
#  updated_at        :datetime
#

class RecommendationFavorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :recommendation
end
