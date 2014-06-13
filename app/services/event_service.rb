class EventService

  def self.analyze(user)
    new(user).process
  end

  def initialize(user)
    @user       = user
    @last_event = @user.activities.last
  end

  def process
    check_submission if @last_event.submission?
    check_advice if @last_event.recommendation?
  end

  def check_submission
    if @user.submission_count == 1
      @user.update(commendation: true)
      activity_builder('commendation', 'award_achieved')
    elsif @user.submission_count % 5 == 0
      @user.increment! :award_level
      activity_builder('award', 'award_achieved')
    end
  end

  def check_advice
    if @user.recommendation_count == 1
      @user.update(medal: true)
      activity_builder('medal', 'award_achieved')
    elsif @user.recommendation_count % 6 == 0
      @user.increment! :star_level
      activity_builder('star', 'award_achieved')
    elsif @user.recommendation_count % 20 == 0
      @user.increment! :cross_level
      activity_builder('cross', 'award_achieved')
    end
  end

  def activity_builder(name, event)
    return unless name && event
    Activity.create(subject: @user, user: @user, name: name, event: event)
  end
end