# == Schema Information
#
# Table name: surveys
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  identifier :string(255)
#

class Survey < ActiveRecord::Base
  has_many :questions
  has_many :submissions
  has_many :answers, through: :submissions
  accepts_nested_attributes_for :questions, allow_destroy: true

  scope :full, -> { where(identifier: 'full') }
  scope :truncated, -> { where(identifier: 'truncated') }

  def print_tree
    SurveySerializer.new(self).to_json
  end

end
