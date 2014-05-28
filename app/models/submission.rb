# == Schema Information
#
# Table name: submissions
#
#  id         :integer          not null, primary key
#  survey_id  :integer
#  created_at :datetime
#  updated_at :datetime
#  has_pain   :boolean
#  user_id    :integer
#  report_id  :integer
#

class Submission < ActiveRecord::Base
  include SubmissionAnalyzer

  belongs_to :survey
  belongs_to :user

  enum pain_severity: [:mild, :moderate]

  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers

  validates :survey, presence: true
  validates :has_pain, inclusion: [true, false]

end
