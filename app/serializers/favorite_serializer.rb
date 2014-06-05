class FavoriteSerializer < ActiveModel::Serializer
  attributes :recommendation_id, :user_id, :favorite
  has_one :recommendation

  def recommendation
    object.recommendation
  end

  def favorite
    object.user == scope
  end

end