module NotificationEvents
  extend ActiveSupport::Concern

  included do
    after_create :set_default_notifications
  end

  def set_default_notifications
    unless admin
      update morning_alert: Time.zone.now.change(hour: 8, min: 30)
      update evening_alert: Time.zone.now.change(hour: 18, min: 30)
    end
  end

end