# == Schema Information
#
# Table name: alerts
#
#  id         :integer          not null, primary key
#  time       :time
#  category   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Alert < ActiveRecord::Base
  has_many :user_alerts
  has_many :users, through: :user_alerts

  validates :category, inclusion: %w( morning_alert evening_alert )
  validates :alert_time, presence: true

  scope :morning, -> { where(category: 'morning_alert') }
  scope :evening, -> { where(category: 'evening_alert') }
  scope :default_alerts, -> { where('alert_time = ? or alert_time = ?', Time.zone.now.change({hour: 9, min: 00}).strftime("%H:%M:%S"), Time.zone.now.change({hour: 19, min: 00}).strftime("%H:%M:%S")) }

  def display_time
    alert_time.strftime('%I:%M:%S %p')
  end

end
