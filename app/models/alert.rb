class Alert < ActiveRecord::Base
  has_many :user_alerts
  has_many :users, through: :user_alerts

  validates :category, inclusion: %w( morning_alert evening_alert )
  validates :time, presence: true
  validates :display_time, presence: true

  def self.default_alerts
    where('display_time = ? or display_time = ?', '8:30 AM', '6:30 PM')
  end

  scope :morning, -> { where(category: 'morning_alert') }
  scope :evening, -> { where(category: 'evening_alert') }

end