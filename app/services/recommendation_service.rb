class RecommendationService

  def initialize(user)
    @user              = user
    # @pain_severity     = @user.submissions.last.pain_severity
  end

  # TODO: implement algorithm here yo
  def get_recommendations
    Recommendation.all.take(3)
  end

end
