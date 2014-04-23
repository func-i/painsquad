class QuestionSerializer < ActiveModel::Serializer
  attributes :choice_type, :content, :tip
  has_many :choices
end