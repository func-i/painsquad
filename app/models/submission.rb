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
  include UserInteractor

  belongs_to :survey
  belongs_to :user

  enum pain_severity: [:mild, :moderate]

  scope :full, -> { includes(:survey).where(surveys: {identifier: 'full'}) }
  scope :truncated, -> { includes(:survey).where(surveys: {identifier: 'truncated'}) }

  scope :by_date, -> { order('submissions.created_at DESC') }
  scope :are_mild, -> { where("pain_severity = ? OR pain_severity IS NULL", Submission::pain_severities[:mild]) }
  scope :are_moderate, -> { where(pain_severity: Submission::pain_severities[:moderate]) }

  scope :between, -> (from_date, to_date) { where(created_at: [from_date.beginning_of_day..to_date.end_of_day]) }

  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers

  validates :survey, presence: true
  validates :user, presence: true
  validates :has_pain, inclusion: [true, false]

  def current_pain_answer
    self.answers.joins(:question).where(questions: {identifier: 'current_pain'}).first
  end

end
