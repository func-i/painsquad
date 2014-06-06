# == Schema Information
#
# Table name: submissions
#
#  id            :integer          not null, primary key
#  survey_id     :integer
#  created_at    :datetime
#  updated_at    :datetime
#  has_pain      :boolean
#  user_id       :integer
#  pain_severity :integer
#

class Submission < ActiveRecord::Base
  belongs_to :survey
  belongs_to :user

  enum pain_severity: [:mild, :moderate]

  scope :full, -> { survey.where(identifier: 'full') }
  scope :truncated, -> { survey.where(identifier: 'truncated') }

  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers

  validates :survey, presence: true
  validates :user, presence: true
  validates :has_pain, inclusion: [true, false]

  after_save :register_event, :set_pain_severity, :set_score

  def register_event
    Activity.create(subject: self, user: user, event: 'submission_complete')
  end

  def set_pain_severity
    if has_pain && pain_severity.nil?
      PainSeverityService.analyze(self)
    end
  end

  def set_score
    ScoringService.analyze(self)
  end

end
