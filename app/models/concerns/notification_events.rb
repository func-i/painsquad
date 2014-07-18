module NotificationEvents
  extend ActiveSupport::Concern

  included do
    after_create :set_default_notifications
  end

  def set_default_notifications
    unless admin
      alerts << Alert.default_alerts
    end
  end

end