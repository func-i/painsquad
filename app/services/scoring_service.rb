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
    @old_score    = @user.score
  end

  def process
    update_user_score
    update_user_ranking
    check_for_awards
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
    User::LEVELS.each do |threshold|
      if @old_score < threshold && new_score >= threshold
        @user.update(rank: next_rank)
      end
    end
  end

  def check_for_awards
    @last_event = @user.activities.last
    check_submission if @last_event.submission?
    check_advice if @last_event.recommendation?
    register_event
  end

  def check_submission
    if @user.submission_count == 1
      @user.update(commendation: true)
    elsif @user.submission_count % 5 == 0
      @user.increment! :award_level
    end
  end

  def check_advice
    if @user.recommendation_count == 1
      @user.update(medal: true)
    elsif @user.recommendation_count % 6 == 0
      @user.increment! :star_level
    elsif @user.recommendation_count % 20 == 0
      @user.increment! :cross_level
    end
  end

  def register_event
    if @user.rank_changed?
      activity_builder(@user.rank, 'level_up')
    elsif @user.commendation_changed?
      activity_builder('commendation', 'award_achieved')
    elsif @user.medal_changed?
      activity_builder('medal', 'award_achieved')
    elsif @user.award_level_changed?
      activity_builder('award', 'award_achieved')
    elsif @user.cross_level_changed?
      activity_builder('cross', 'award_achieved')
    elsif @user.star_level_changed?
      activity_builder('star', 'award_achieved')
    end
  end

  def activity_builder(name, event)
    return unless name && event
    Activity.create(subject: @user, user: @user, name: name, event: event)
  end

end
