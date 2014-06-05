# == Schema Information
#
# Table name: activities
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  subject_id   :integer          not null
#  subject_type :string(255)      not null
#  name         :string(255)
#  event        :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Activity < ActiveRecord::Base
  belongs_to :subject, polymorphic: true
  belongs_to :user

  scope :most_recent, -> { order('created_at DESC').first }

  scope :ranking_events, -> { where('event=? OR event=?', 'user_created', 'level_up').order('created_at ASC') }
  scope :recommendation_events, -> { where('event=?', 'recommendation_complete').order('created_at ASC') }
  scope :submission_events, -> { where('event=?', 'submission_complete') }

  # FIXME: this doesn't belong here!
  after_create :increment_user_points

  def submission?
    subject_type == 'Submission'
  end

  def recommendation?
    subject_type == 'Recommendation'
  end

  protected

  def increment_user_points
    if event == 'recommendation_complete'
      user.increment! :score, 5
    end
  end

end
