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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recommendation_favorite, :class => 'RecommendationFavorites' do
  end
end
