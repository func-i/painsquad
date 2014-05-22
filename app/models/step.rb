# == Schema Information
#
# Table name: steps
#
#  id                :integer          not null, primary key
#  recommendation_id :integer
#  content           :string(255)
#  tip               :string(255)
#  audio_path        :string(255)
#  video_path        :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class Step < ActiveRecord::Base
  belongs_to :recommendation
end
