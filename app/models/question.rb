# Submission has many Questions, a Question has many Choices
class Question < ActiveRecord::Base
  QUESTION_TYPES = %w( boolean radio slider bodymap checklist checklist-grid checklist-extra textbox )

  belongs_to :survey
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices, allow_destroy: true

  validate :valid_question_type

  def valid_question_type
    unless QUESTION_TYPES.include? question_type
      errors.add(:base, 'Must submit a valid question type')
    end
  end
end
