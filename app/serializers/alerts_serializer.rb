class AlertsSerializer < ActiveModel::Serializer
  attributes :morning_alerts, :evening_alerts

  def morning_alerts
    [
      { label: '8:00 AM', selected: false },
      { label: '8:30 AM', selected: true },
      { label: '9:00 AM', selected: false },
      { label: '9:30 AM', selected: false },
      { label: '10:00 AM', selected: false },
      { label: '10:30 AM', selected: false },
      { label: '11:00 AM', selected: false }
    ]
  end

  def evening_alerts
    [
      { label: '6:00 PM', selected: false },
      { label: '6:30 PM', selected: true },
      {  label: '7:00 PM', selected: false },
      {  label: '7:30 PM', selected: false },
      {  label: '8:00 PM', selected: false },
      {  label: '8:30 PM', selected: false },
      {  label: '9:00 PM', selected: false }
    ]
  end

end
