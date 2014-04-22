class Survey < ActiveRecord::Base

  has_many :questions
  has_many :submissions
  has_many :answers, through: :submissions

  # accepts_nested_attributes_for :questions, allow_destroy: true

end
