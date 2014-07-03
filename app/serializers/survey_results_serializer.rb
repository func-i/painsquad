class SurveyResultsSerializer < ActiveModel::Serializer
  attributes :message

  def message
    present_user.determine_pain_severity_message
  end

end