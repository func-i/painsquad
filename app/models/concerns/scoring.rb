module Scoring
  extend ActiveSupport::Concern

  included do
    after_create :set_user_score
  end

  def set_user_score
    score = survey.full? ? 25 : 10
    user.increment!(:score, score)
  end

end
