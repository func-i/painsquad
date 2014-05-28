class SurveyService

  def initialize(user)
    @user = user
  end

  def get_survey
    binding.pry
  end

end

# if @survey = Survey.find_by(identifier: 'full')
#   @survey
# else
#   @survey = SurveyBuilder.new(identifier: 'full').build
# end
