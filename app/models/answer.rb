class Answer < ActiveRecord::Base

  belongs_to :submission
  belongs_to :question

  has_many :choices, dependent: :destroy

  accepts_nested_attributes_for :choices, reject_if: :all_blank

end
