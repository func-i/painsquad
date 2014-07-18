class AlertsSerializer < ActiveModel::Serializer
  attributes :morning_alerts, :evening_alerts

  # TODO: set selected true/false based on present_user
  def morning_alerts
    [
      { canonical: Time.now.change({hour: 8, min: 00}), label: '8:00 AM',  selected: false, type: 'morning_alert' },
      { canonical: Time.now.change({hour: 8, min: 30}), label: '8:30 AM',  selected: true, type: 'morning_alert' },
      { canonical: Time.now.change({hour: 9, min: 00}), label: '9:00 AM',  selected: false, type: 'morning_alert' },
      { canonical: Time.now.change({hour: 9, min: 30}), label: '9:30 AM',  selected: false, type: 'morning_alert' },
      { canonical: Time.now.change({hour: 10, min: 00}), label: '10:00 AM', selected: false, type: 'morning_alert' },
      { canonical: Time.now.change({hour: 10, min: 30}), label: '10:30 AM', selected: false, type: 'morning_alert' },
      { canonical: Time.now.change({hour: 11, min: 00}), label: '11:00 AM', selected: false, type: 'morning_alert' }
    ]
  end

  def evening_alerts
    [
      { canonical: Time.now.change({hour: 18, min: 00}), label: '6:00 PM', selected: false, type: 'evening_alert' },
      { canonical: Time.now.change({hour: 18, min: 30}), label: '6:30 PM', selected: true, type: 'evening_alert' },
      { canonical: Time.now.change({hour: 19, min: 00}), label: '7:00 PM', selected: false, type: 'evening_alert' },
      { canonical: Time.now.change({hour: 19, min: 30}), label: '7:30 PM', selected: false, type: 'evening_alert' },
      { canonical: Time.now.change({hour: 20, min: 00}), label: '8:00 PM', selected: false, type: 'evening_alert' },
      { canonical: Time.now.change({hour: 20, min: 30}), label: '8:30 PM', selected: false, type: 'evening_alert' },
      { canonical: Time.now.change({hour: 21, min: 00}), label: '9:00 PM', selected: false, type: 'evening_alert' }
    ]
  end

end
