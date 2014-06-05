# == Schema Information
#
# Table name: activities
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  subject_id   :integer          not null
#  subject_type :string(255)      not null
#  name         :string(255)      not null
#  created_at   :datetime
#  updated_at   :datetime
#

class Activity < ActiveRecord::Base
  belongs_to :subject, polymorphic: true
  belongs_to :user

  scope :ranking_events, -> { where('event=? OR event=?', 'user_created', 'level_up').order('created_at ASC') }

  scope :award_events, -> { where('').order('created_at ASC') }

  scope :advice_events, -> { where('event=?', 'recommendation_complete').order('created_at ASC') }

  after_create :increment_user_points

  def increment_user_points
    if advice_event?
      user.increment! :score, 5
    end
  end

  protected

  def advice_event?
    event == 'advice_complete'
  end

end
