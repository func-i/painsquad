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

  scope :recommendation_events, -> { where('event=?', 'recommendation_complete').order('created_at ASC') }

  after_create :increment_user_points

  protected

  def increment_user_points
    if recommendation_event?
      user.increment! :score, 5
    end
  end

  def recommendation_event?
    event == 'recommendation_complete'
  end

end
