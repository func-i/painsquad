# == Schema Information
#
# Table name: favorites
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  recommendation_id :integer
#  created_at        :datetime
#  updated_at        :datetime
#

class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :recommendation

  validates :recommendation_id, uniqueness: { scope: :user_id }, presence: true
end
