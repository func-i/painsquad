# == Schema Information
#
# Table name: questions
#
#  id            :integer          not null, primary key
#  survey_id     :integer
#  question_type :string(255)
#  content       :string(255)
#  tip           :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  identifier    :string(255)
#

class Question < ActiveRecord::Base
  QUESTION_TYPES = %w( boolean radio slider bodymap checklist checklist-grid checklist-extra textbox )

  belongs_to :survey
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices, allow_destroy: true

  serialize :extremes, JSON

  validates :question_type, inclusion: QUESTION_TYPES

  scope :identifiers, -> { where.not(identifier: nil) }

end
