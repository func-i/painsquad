class AwardService

  def self.analyze(activity)
    new(activity).perform
  end

  def initialize(activity)
    @activity   = activity
    @user       = @activity.user
    @last_event = @user.activities.last
  end

  def perform
    if @last_event.submission?
      check_submissions
    elsif @last_event.recommendation?
      check_advice
    end
    register_event
  end

  protected

  def check_submissions
    if @user.submission_count == 1
      @user.first_submission!
    elsif @user.submission_count % 5 == 0
      @user.increment! :award_level
    end
  end

  def check_advice
    if @user.recommendation_count == 1
      @user.first_recommendation!
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

  private

  def activity_builder(name, event)
    return unless name && event
    Activity.create(subject: @user, user: @user, name: name, event: event)
  end

end

