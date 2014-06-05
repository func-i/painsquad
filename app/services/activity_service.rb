class ActivityService

  def initialize(subject, user, event)
    @subject = subject
    @user    = user
    @event   = event
  end

  def save
    Activity.create(subject: @subject, user: @user, event: @event)
  end

  protected

end
