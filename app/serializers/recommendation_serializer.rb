class RecommendationSerializer < ActiveModel::Serializer
  attributes :id, :title, :image, :duration, :context, :favorite, :description, :byline, :style
  has_many :steps
end