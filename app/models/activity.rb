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

  scope :ranking_events, -> { where('event=? OR event=?', 'user_created', 'level_up') }
  scope :recommendation_events, -> { where('event=?', 'recommendation_complete') }
  scope :submission_events, -> { where('event=?', 'submission_complete') }
  scope :award_events, -> { where('event=?', 'award_achieved') }

  def submission?
    subject_type == 'Submission'
  end

  def recommendation?
    subject_type == 'Recommendation'
  end

  after_save :process_interaction

  def process_interaction
    if recommendation?
      UserInteractorService.process(user: user, interaction_object: self, interaction_type: :recommendation_complete)
    end
  end

end
