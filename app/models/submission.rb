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
  belongs_to :survey
  belongs_to :user

  enum pain_severity: [:mild, :moderate]

  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers

  validates :survey, presence: true
  validates :has_pain, inclusion: [true, false]

  def print_tree
    SubmissionSerializer.new(self).to_json
  end

  # after_create :create_report

  # def create_report
  #   report = Report.create(
  #     submission_id: id,
  #     user_id:       user_id,
  #     has_pain:      has_pain,
  #     pain_severity: set_pain_severity
  #   )
  #   update(report_id: report.id)
  # end

  # # TODO: use real logic here
  # def set_pain_severity
  #   SubmissionAnalyzer.determine_pain_severity(answers)
  # end

end
