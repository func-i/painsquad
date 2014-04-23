class SurveySerializer < ActiveModel::Serializer
  attributes :title
  has_many :questions

  # eager load serialized association
  def questions
    object.questions.includes(:choices)
  end

end