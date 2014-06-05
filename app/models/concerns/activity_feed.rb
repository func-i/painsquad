module ActivityFeed
  extend ActiveSupport::Concern

  included do
    after_create :user_created_activity
    after_update :rank_activity
  end

  def user_created_activity
    Activity.create(
      subject: self,
      user:    self,
      event:   'user_created'
    )
  end

  def rank_activity
    if rank_changed?
      Activity.create(
        subject: self,
        user:    self,
        name:    rank,
        event:   'level_up'
      )
    end
  end

end
