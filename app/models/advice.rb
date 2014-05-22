# == Schema Information
#
# Table name: advices
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Advice < ActiveRecord::Base
  has_many :recommendations
end
