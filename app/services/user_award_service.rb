class UserAwardService

  def self.analyze(object, modals = nil)
    new(object, modals).process
  end

  def initialize(object, modals)
    @object     = object
    @user       = object.user
    @last_event = @user.activities.last

    @modals = modals || []
  end

  def process
    check_submission if @object.is_a?(Submission)
    check_advice if @last_event.recommendation?
    @modals
  end

  def check_submission
    if @user.submissions.count == 1
      @user.update commendation: true
      activity_builder 'commendation', 'award_achieved'

      # => Set a commendation modal
      @modals << 'commendation'
    elsif @user.submissions.count % 5 == 0
      @user.increment! :award_level
      activity_builder 'award', 'award_achieved'

      @modals << 'award'
    end
  end

  def check_advice
    if @user.recommendation_count == 1
      @user.update medal: true
      activity_builder 'medal', 'award_achieved'

      @modals << 'medal'
    elsif @user.recommendation_count % 6 == 0
      @user.increment! :star_level
      activity_builder 'star', 'award_achieved'

      @modals << 'star'
    elsif @user.recommendation_count % 20 == 0
      @user.increment! :cross_level
      activity_builder 'cross', 'award_achieved'

      @modals << 'cross'
    end
  end

  def activity_builder name, event
    return unless name && event
    Activity.create subject: @user, user: @user, name: name, event: event
  end

end