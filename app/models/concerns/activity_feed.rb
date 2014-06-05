module ActivityFeed
  extend ActiveSupport::Concern

  included do
    after_create :create_initial_activity
    after_update :create_rank_activity
  end

  def submission_count
  end

  def submission_award?
    submission_count % 5 == 0
  end

  def previous_submissions
    submissions.order('updated_at DESC').take 5
  end

  def create_initial_activity
    Activity.create(
      subject: self,
      user:    self,
      event:   'user_created'
    )
  end

  def create_rank_activity
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
