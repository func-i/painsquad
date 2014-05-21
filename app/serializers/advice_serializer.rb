class AdviceSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :recommendations
end