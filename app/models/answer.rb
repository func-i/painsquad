# Answer Model - created through nested attributes from Submission
class Answer < ActiveRecord::Base
  belongs_to :submission
  belongs_to :choice
  belongs_to :question

  # validates :value, numericality: {
  #   greater_than_or_equal_to: 0,
  #   less_than_or_equal_to:    100,
  #   allow_nil:                true
  # }

  # belongs_to :question
  # has_many :choices, dependent: :destroy
  # accepts_nested_attributes_for :choices, reject_if: :all_blank
end
