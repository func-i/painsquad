class SubmissionSerializer < ActiveModel::Serializer
  attributes :id, :survey_id, :has_pain
  has_many :answers_attributes

  def answers_attributes
    object.answers.includes(:choices, :questions)
  end

end