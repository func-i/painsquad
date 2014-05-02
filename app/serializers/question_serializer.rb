class QuestionSerializer < ActiveModel::Serializer

  attributes :question_id, :question_type, :content, :tip
  has_many :choices

  def choices
    object.choices.order('id')
  end

  def question_id
    object.id
  end

end