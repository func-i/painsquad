class QuestionSerializer < ActiveModel::Serializer
  attributes :question_id, :question_type, :content, :tip, :identifier, :extremes
  has_many :choices

  def choices
    object.choices.order('id ASC')
  end

  def question_id
    object.id
  end

end