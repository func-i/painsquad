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

  scope :full, -> { survey.where(identifier: 'full') }
  scope :truncated, -> { survey.where(identifier: 'truncated') }

  scope :by_date, -> { order('created_at DESC') }

  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers

  validates :survey, presence: true
  validates :user, presence: true
  validates :has_pain, inclusion: [true, false]

end
