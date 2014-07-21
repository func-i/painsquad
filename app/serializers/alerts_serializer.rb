class AlertsSerializer < ActiveModel::Serializer
  attributes :morning_alerts, :evening_alerts

  def morning_alerts
    Alert.morning.inject([]) do |accumulator, element|
      accumulator << AlertEachSerializer.new(element, scope: scope, root: false)
    end
  end

  def evening_alerts
    Alert.evening.inject([]) do |accumulator, element|
      accumulator << AlertEachSerializer.new(element, scope: scope, root: false)
    end
  end

end
