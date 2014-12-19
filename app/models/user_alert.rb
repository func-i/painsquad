# == Schema Information
#
# Table name: user_alerts
#
#  id       :integer          not null, primary key
#  alert_id :integer
#  user_id  :integer
#

class UserAlert < ActiveRecord::Base
  belongs_to :user
  belongs_to :alert
end
