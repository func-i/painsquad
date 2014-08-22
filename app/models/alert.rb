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
  validates :time, presence: true

  scope :morning, -> { where(category: 'morning_alert') }
  scope :evening, -> { where(category: 'evening_alert') }
  scope :default_alerts, -> { where('time = ? or time = ?', Time.zone.now.change({hour: 8, min: 30}).strftime("%H:%M:%S"), Time.zone.now.change({hour: 18, min: 30}).strftime("%H:%M:%S")) }

  def display_time
    time.strftime('%I:%M:%S %p')
  end

end
