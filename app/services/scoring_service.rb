class ScoringService
  FULL_SCORE      = 25
  TRUNC_SCORE     = 10
  LEVEL_THRESHOLD = [ 300, 700, 1200, 2000, 2800 ]

  def self.calculate(submission, user)
    new(submission, user).process
  end

  def initialize(submission, user)
    @submission   = submission
    @user         = user
    @survey_score = submission.survey.full? ? FULL_SCORE : TRUNC_SCORE
    @old_score    = user.score
  end

  def process
    update_user_score
    update_user_ranking
  end

  protected

  def update_user_score
    @user.increment! :score, @survey_score
  end

  # iterates through level thresholds, levels User if threshold crossed
  def update_user_ranking
    new_score    = @user.score
    current_rank = @user[:rank]
    next_rank    = current_rank + 1
    LEVEL_THRESHOLD.each do |threshold|
      if @old_score < threshold && new_score >= threshold
        @user.update(rank: next_rank)
      end
    end
  end

end
