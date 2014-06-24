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


# Pain Severity Advice Algorithm
# MILD:
  # order Psychological -> Physical -> Pharmacological
  # prioritise psychological/physical

# MODERATE/SEVERE:
  # order Pharmacological (x2) -> Psych x1 -> Physical x1
  # random from psych/physical

# After completing a survey, alert popup to bring user to recommended advice section*