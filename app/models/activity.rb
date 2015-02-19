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
  include UserInteractor

  belongs_to :subject, polymorphic: true
  belongs_to :user

  scope :ranking_events, -> { where(event: %w(user_created level_up)) }
  scope :recommendation_events, -> { where('event=?', 'recommendation_complete') }
  scope :submission_events, -> { where('event=?', 'submission_complete') }
  scope :award_events, -> { where('event=?', 'award_achieved') }
  scope :level_up_events, -> { where('event=?', 'level_up') }  

  def submission?
    subject_type == 'Submission'
  end

  def recommendation?
    subject_type == 'Recommendation'
  end

  def level_up?
    event == 'level_up'
  end

end
