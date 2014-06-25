class RecommendationSerializer < ActiveModel::Serializer
  attributes :id, :title, :image, :duration, :context, :description, :byline, :style, :favorite, :section, :group
  has_many :steps
  has_many :nested_recommendations

  def favorite
    object.favorites.where(user: scope).any?
  end

end