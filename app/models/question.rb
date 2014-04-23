class Question < ActiveRecord::Base

  belongs_to :survey
  has_many :choices, dependent: :destroy

  accepts_nested_attributes_for :choices, allow_destroy: true

end
