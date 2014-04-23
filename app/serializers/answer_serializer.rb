class AnswerSerializer < ActiveModel::Serializer

  attributes :question, :choice_value, :choice_text

  def question
    object.choice.question
  end

  def choice_value
    object.choice.value
  end

  def choice_text
    object.choice.textfield
  end

end