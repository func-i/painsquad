# == Schema Information
#
# Table name: answers
#
#  id            :integer          not null, primary key
#  submission_id :integer
#  choice_id     :integer
#  question_id   :integer
#  value         :integer
#  custom_text   :text
#  created_at    :datetime
#  updated_at    :datetime
#  data_object   :text
#

class Answer < ActiveRecord::Base
  belongs_to :submission
  belongs_to :choice
  belongs_to :question

  serialize :data_object, JSON

  # TODO: fix this
  # validates :value, numericality: {
  #   greater_than_or_equal_to: 0,
  #   less_than_or_equal_to:    100,
  #   allow_nil:                true
  # }


  # belongs_to :question
  # has_many :choices, dependent: :destroy
  # accepts_nested_attributes_for :choices, reject_if: :all_blank
end
