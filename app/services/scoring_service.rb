class ScoringService
  FULL_SCORE  = 25
  TRUNC_SCORE = 10

  def self.set submission
    new(submission).process
  end

  def initialize submission
    @submission = submission
    @user       = @submission.user
    @score      = @submission.survey.full? ? FULL_SCORE : TRUNC_SCORE
  end

  def process
    update_user_score
    update_user_ranking
  end

  protected

  def update_user_score
    @user.increment! :score, @score
  end

  def update_user_ranking
    user_score   = @user.score
    current_rank = @user[:rank]
    next_rank    = current_rank + 1
    if user_score >= 300
      @user.update(rank: next_rank)
    elsif user_score >= 700
      @user.update(rank: next_rank)
    elsif user_score >= 1200
      @user.update(rank: next_rank)
    elsif user_score >= 2000
      @user.update(rank: next_rank)
    elsif user_score >= 2800
      @user.update(rank: next_rank)
    end
  end

end
