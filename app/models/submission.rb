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
  include SubmissionAnalyzer

  belongs_to :survey
  belongs_to :user

  enum pain_severity: [:mild, :moderate]

  scope :full, -> { survey.where(identifier: 'full') }
  scope :truncated, -> { survey.where(identifier: 'truncated') }

  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers

  validates :survey, presence: true
  validates :has_pain, inclusion: [true, false]

  after_create :set_score

  def set_score
    ScoringService.set self
  end

end
