def times
  # [
  #   { alert_time: Time.zone.now.change({hour: 6, min: 00}).strftime("%H:%M:%S"), category: 'morning_alert' },
  #   { alert_time: Time.zone.now.change({hour: 6, min: 30}).strftime("%H:%M:%S"), category: 'morning_alert' },
  #   { alert_time: Time.zone.now.change({hour: 7, min: 00}).strftime("%H:%M:%S"), category: 'morning_alert' },
  #   { alert_time: Time.zone.now.change({hour: 7, min: 30}).strftime("%H:%M:%S"), category: 'morning_alert' },
  #   { alert_time: Time.zone.now.change({hour: 8, min: 00}).strftime("%H:%M:%S"), category: 'morning_alert' },
  #   { alert_time: Time.zone.now.change({hour: 8, min: 30}).strftime("%H:%M:%S"), category: 'morning_alert' },
  #   { alert_time: Time.zone.now.change({hour: 9, min: 00}).strftime("%H:%M:%S"), category: 'morning_alert' },
  #   { alert_time: Time.zone.now.change({hour: 9, min: 30}).strftime("%H:%M:%S"), category: 'morning_alert' },
  #   { alert_time: Time.zone.now.change({hour: 10, min: 00}).strftime("%H:%M:%S"), category: 'morning_alert' },
  #   { alert_time: Time.zone.now.change({hour: 10, min: 30}).strftime("%H:%M:%S"), category: 'morning_alert' },
  #   { alert_time: Time.zone.now.change({hour: 11, min: 00}).strftime("%H:%M:%S"), category: 'morning_alert' },
  #   { alert_time: Time.zone.now.change({hour: 18, min: 00}).strftime("%H:%M:%S"), category: 'evening_alert' },
  #   { alert_time: Time.zone.now.change({hour: 18, min: 30}).strftime("%H:%M:%S"), category: 'evening_alert' },
  #   { alert_time: Time.zone.now.change({hour: 19, min: 00}).strftime("%H:%M:%S"), category: 'evening_alert' },
  #   { alert_time: Time.zone.now.change({hour: 19, min: 30}).strftime("%H:%M:%S"), category: 'evening_alert' },
  #   { alert_time: Time.zone.now.change({hour: 20, min: 00}).strftime("%H:%M:%S"), category: 'evening_alert' },
  #   { alert_time: Time.zone.now.change({hour: 20, min: 30}).strftime("%H:%M:%S"), category: 'evening_alert' },
  #   { alert_time: Time.zone.now.change({hour: 21, min: 00}).strftime("%H:%M:%S"), category: 'evening_alert' }
  # ]

  (Date.today.beginning_of_day.to_i..Date.today.end_of_day.to_i).to_a.in_groups_of(15.minutes).collect(&:first).collect do |t| 
    time = Time.at(t)
    {alert_time: Time.zone.now.change({hour: time.hour, min: time.min}).strftime("%H:%M:%S"), category: (time.hour > 14 ? 'evening_alert' : 'morning_alert')}
  end
end

Alert.destroy_all
times.each do |time_hash|
  Alert.create! time_hash
end

User.destroy_all
User.create! username: 'Admin User', email: 'admin@sickkids.ca', password: 'painsquad', healthcare_provider_email: 'admin@sickkids.ca', admin: true, phone_number: '555-555-5555'
User.create! username: 'First Test User', email: 'test@uhn.com', password: 'password', healthcare_provider_email: 'test@uhn.com', phone_number: '555-555-5555'
User.create! username: 'Second Test User', email: 'test@sickkids.ca', password: 'password', healthcare_provider_email: 'test@sickkids.ca', phone_number: '555-555-5555'

Rake::Task['advice:all'].invoke
Rake::Task['survey:create'].invoke
