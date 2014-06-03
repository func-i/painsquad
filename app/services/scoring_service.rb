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
    user_score = @user.score
    if user_score >= 300
      @user.rank = :junior_detective
    elsif user_score >= 700
      @user.rank = :detective
    elsif user_score >= 1200
      @user.rank = :sergeant
    elsif user_score >= 2000
      @user.rank = :lieutenant
    elsif user_score >= 2800
      @user.rank = :chief
    end
  end

end
