class SurveySerializer < ActiveModel::Serializer
  attributes :id, :title, :identifier, :xp_points
  has_many :questions

  # eager load serialized association
  def questions
    object.questions.includes(:choices).order('id ASC')
  end

end