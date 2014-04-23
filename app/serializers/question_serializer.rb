class QuestionSerializer < ActiveModel::Serializer
  attributes :choice_type, :title, :tip
  has_many :choices
end