module AdviceScoring
  extend ActiveSupport::Concern

  def advice_score_unlocked?
    if activities.last.recommendation? && submissions.any?
      return prior_recommendations_completed?
    else
      return false
    end
  end

  # find all completed recommendations between last submission date and current advice date
  # returns false if TWO or more of the same recommendation exist between last submission date and current advice date
  # otherwise, its valid for advice scoring
  def prior_recommendations_completed?
    last_advice = self.activities.last
    last_survey = self.submissions.last
    recommendations_in_range = recommendation_events.where(created_at: last_survey.created_at..last_advice.created_at)
    prior_matching_recommendations = recommendations_in_range.where(subject: last_advice.subject)
    prior_matching_recommendations.count == 1
  end

end
