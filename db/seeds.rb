def times
  [
    { time: Time.now.change({hour: 8, min: 00}), display_time: '8:00 AM', category: 'morning_alert' },
    { time: Time.now.change({hour: 8, min: 30}), display_time: '8:30 AM', category: 'morning_alert' },
    { time: Time.now.change({hour: 9, min: 00}), display_time: '9:00 AM', category: 'morning_alert' },
    { time: Time.now.change({hour: 9, min: 30}), display_time: '9:30 AM', category: 'morning_alert' },
    { time: Time.now.change({hour: 10, min: 00}), display_time: '10:00 AM', category: 'morning_alert' },
    { time: Time.now.change({hour: 10, min: 30}), display_time: '10:30 AM', category: 'morning_alert' },
    { time: Time.now.change({hour: 11, min: 00}), display_time: '11:00 AM', category: 'morning_alert' },
    { time: Time.now.change({hour: 18, min: 00}), display_time: '6:00 PM', category: 'evening_alert' },
    { time: Time.now.change({hour: 18, min: 30}), display_time: '6:30 PM', category: 'evening_alert' },
    { time: Time.now.change({hour: 19, min: 00}), display_time: '7:00 PM', category: 'evening_alert' },
    { time: Time.now.change({hour: 19, min: 30}), display_time: '7:30 PM', category: 'evening_alert' },
    { time: Time.now.change({hour: 20, min: 00}), display_time: '8:00 PM', category: 'evening_alert' },
    { time: Time.now.change({hour: 20, min: 30}), display_time: '8:30 PM', category: 'evening_alert' },
    { time: Time.now.change({hour: 21, min: 00}), display_time: '9:00 PM', category: 'evening_alert' }
  ]
end

Alert.destroy_all
times.each do |time_hash|
  Alert.create! time_hash
end

User.destroy_all
User.create! username: 'Admin User', email: 'admin@sickkids.ca', password: 'painsquad', healthcare_provider_email: 'admin@sickkids.ca', admin: true
User.create! username: 'First Test User', email: 'test@uhn.com', password: 'password', healthcare_provider_email: 'test@uhn.com'
User.create! username: 'Second Test User', email: 'test@sickkids.ca', password: 'password', healthcare_provider_email: 'test@sickkids.ca'

Rake::Task['survey:all'].invoke
Rake::Task['advice:all'].invoke

