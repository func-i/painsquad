class AdviceSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :recommendations

  def recommendations
    object.recommendations.includes(:steps).order('id ASC')
  end
end
