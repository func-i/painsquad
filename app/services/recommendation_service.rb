class RecommendationService

  DIST = {
    'mild'     => [ 'psychological', 'physical', 'pharmacological' ],
    'moderate' => [ 'pharmacological', 'pharmacological', 'psychological', 'physical' ]
  }

  def initialize(user)
    @user          = user
    @pain_severity = @user.last_pain_report
  end

  def get_recommendations
    DIST[@pain_severity].inject([]) do |result, element|
      result << Recommendation.send(element).sample
    end
  end

end
