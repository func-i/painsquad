class EventService

  def self.create_activity(user)
    new(user).perform
  end

  def initialize(user)
    @user = user
  end

  def perform
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
