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
#  extremes      :string(255)
#  tag           :string(255)
#  report_label  :string(255)
#

class Question < ActiveRecord::Base
  QUESTION_TYPES = %w( boolean radio slider bodymap checklist checklist-grid checklist-extra textbox )
  EDITABLE_TYPES = %w( radio slider checklist checklist-grid checklist-extra )

  belongs_to :survey
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices, allow_destroy: true

  serialize :extremes, JSON

  validates :question_type, inclusion: QUESTION_TYPES

  scope :identifiers, -> { where.not(identifier: nil) }

  def editable_choices
    choices.any? && EDITABLE_TYPES.include?(question_type)
  end

  def display_name
    name.empty? ? truncated_display : normal_display
  end

  private

  def normal_display
    "#{question_type.capitalize} - #{name.titleize}"
  end

  def truncated_display
    question_type.capitalize
  end

end
