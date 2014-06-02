class FavoriteSerializer < ActiveModel::Serializer
  attributes :recommendation_id, :user_id
  has_one :recommendation

  # def recommendation
  #   object.recommendation.includes(:steps, :nested_recommendations)
  # end

end