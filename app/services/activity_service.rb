class ActivityService
  attr_accessor :activity, :user

  def initialize(activity, user)
    @activity = activity
    @user     = user
    @event    = activity.event
    save_user
  end

  def create
    if @activity.save
      delegate_event
    end
  end

  protected

  def save_user
    @activity.user = @user
  end

  def delegate_event
    if @event == 'recommendation_complete'
      @user.increment! :score, 5
    end
  end

end
