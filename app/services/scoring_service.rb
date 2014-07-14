class ScoringService
  FULL_SCORE  = 25
  TRUNC_SCORE = 10

  def self.analyze(submission)
    new(submission).process
  end

  def initialize(submission)
    @submission   = submission
    @user         = @submission.user
    @survey_score = @submission.survey.full? ? FULL_SCORE : TRUNC_SCORE
  end

  def process
    @user.increment! :score, @survey_score
  end

end