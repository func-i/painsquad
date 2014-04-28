class Choice < ActiveRecord::Base

  belongs_to :question
  has_many :answers

  validates :value, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to:    100,
    allow_nil:                true
  }

end
