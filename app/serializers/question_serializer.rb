class QuestionSerializer < ActiveModel::Serializer
  attributes :question_id, :choice_type, :title, :tip
  has_many :choices

  def question_id
    object.id
  end

end