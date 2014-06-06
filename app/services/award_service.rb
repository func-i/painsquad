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
  end

  protected

  def check_submissions
    if @user.submission_count % 5 == 0
      @user.increment! :award_level
    end
  end

  def check_advice
    if @user.recommendation_count % 6 == 0
      @user.increment! :star_level
    elsif @user.recommendation_count % 20 == 0
      @user.increment! :cross_level
    end
  end

end
