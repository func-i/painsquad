class SurveySerializer < ActiveModel::Serializer
  attributes :id, :title, :identifier, :xp_points#, :message
  has_many :questions

  # eager load serialized association
  def questions
    object.questions.includes(:choices).order('id ASC')
  end

  def message
    present_user.previous_pain_status
  end

end