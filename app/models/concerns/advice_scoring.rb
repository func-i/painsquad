module AdviceScoring
  extend ActiveSupport::Concern

  included do
  end

  # the user can only complete each individual recommendation once and its locked
  # then it is locked until they complete a survey
  def advice_score_unlocked?
    true
  end

end
