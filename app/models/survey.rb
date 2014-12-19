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
  has_many :questions, dependent: :destroy
  has_many :submissions, dependent: :destroy
  has_many :answers, through: :submissions
  accepts_nested_attributes_for :questions, allow_destroy: true

  scope :full, -> { where(identifier: 'full') }
  scope :truncated, -> { where(identifier: 'truncated') }

  validates :identifier, uniqueness: true

  def full?
    identifier == 'full'
  end

  def truncated?
    identifier == 'truncated'
  end

  def xp_points
    full? ? 25 : 10
  end

end
