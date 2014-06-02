class RecommendationSerializer < ActiveModel::Serializer
  attributes :id, :title, :image, :duration, :context, :description, :byline, :style, :favorite
  has_many :steps
  has_many :nested_recommendations

  def favorite
    object.favorites.where(user: current_user).any?
  end

end