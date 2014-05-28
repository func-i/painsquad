# == Schema Information
#
# Table name: submissions
#
#  id         :integer          not null, primary key
#  survey_id  :integer
#  created_at :datetime
#  updated_at :datetime
#  has_pain   :boolean
#
class Submission < ActiveRecord::Base
  belongs_to :survey
  belongs_to :user

  has_one :report

  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers

  validates :survey, presence: true
  validates :has_pain, inclusion: [true, false]

  def print_tree
    SubmissionSerializer.new(self).to_json
  end

  after_create :create_report

  def create_report
    report = Report.new(submission_id: id, user_id: user_id, has_pain: has_pain)
    # report.pain_severity = ""
    binding.pry
  end

end
