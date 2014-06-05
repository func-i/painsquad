class FavoriteSerializer < ActiveModel::Serializer
  attributes :recommendation_id, :user_id, :is_favorited
  has_one :recommendation

  # def recommendation
  #   object.recommendation.includes(:steps, :nested_recommendations)
  # end

  def is_favorited
    [true, false].sample
  end

end