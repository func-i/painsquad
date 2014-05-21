class RecommendationSerializer < ActiveModel::Serializer
  attributes :id, :title, :image, :duration, :context, :favorite
  has_many :steps
end