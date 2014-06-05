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
    if @event == 'submission_complete'
      # do nothing, handled in SubmissionsController
    elsif @event == 'recommendation_complete'
      #increment score by 5!
      binding.pry
    elsif @event == 'level_up'
      # do something here?
      binding.pry
    end
  end

end
