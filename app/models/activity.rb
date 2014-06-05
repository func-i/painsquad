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

  scope :ranking_events, -> { where('event=? OR event=?', 'user_created', 'level_up').order('created_at ASC') }
  scope :recommendation_events, -> { where('event=?', 'recommendation_complete').order('created_at ASC') }
  scope :submission_events, -> { where('event=?', 'submission_complete') }

  def submission?
    subject_type == 'Submission'
  end

  def recommendation?
    subject_type == 'Recommendation'
  end

end
