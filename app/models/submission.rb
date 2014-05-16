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

# Top level Submission, accepts answers_attributes
class Submission < ActiveRecord::Base
  belongs_to :survey
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers

  validates :survey, presence: true
  validates :has_pain, inclusion: [true, false]

end
