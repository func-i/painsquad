class Submission < ActiveRecord::Base

  belongs_to :survey
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers

  validates :has_pain, presence: true

  def print_tree
    SubmissionSerializer.new(self).to_json
  end

end
