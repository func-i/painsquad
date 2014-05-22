# == Schema Information
#
# Table name: recommendations
#
#  id          :integer          not null, primary key
#  advice_id   :integer
#  title       :string(255)
#  image       :string(255)
#  duration    :string(255)
#  context     :string(255)
#  description :string(255)
#  byline      :string(255)
#  favorite    :boolean          default(FALSE)
#  created_at  :datetime
#  updated_at  :datetime
#

class Recommendation < ActiveRecord::Base
  belongs_to :advice
  has_many :steps
  validates :style, inclusion: %w(basic slideshow nested)
end
