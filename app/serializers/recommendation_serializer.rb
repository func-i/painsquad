class RecommendationSerializer < ActiveModel::Serializer
  attributes :id, :title, :image, :duration, :context, :favorite
end