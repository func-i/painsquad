class QuestionSerializer < ActiveModel::Serializer

  attributes :question_type, :content, :tip
  has_many :choices

end