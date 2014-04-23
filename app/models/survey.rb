class Survey < ActiveRecord::Base

  has_many :questions, dependent: :destroy
  has_many :submissions
  has_many :answers, through: :submissions

  accepts_nested_attributes_for :questions, allow_destroy: true

  def print_tree
    SurveySerializer.new(self).to_json
  end

end
