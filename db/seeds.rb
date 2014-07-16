User.destroy_all

User.create! username: 'Admin User', email: 'admin@sickkids.ca', password: 'painsquad', healthcare_provider_email: 'admin@sickkids.ca', admin: true
User.create! username: 'First Test User', email: 'test@uhn.com', password: 'password', healthcare_provider_email: 'test@uhn.com'
User.create! username: 'Second Test User', email: 'test@sickkids.ca', password: 'password', healthcare_provider_email: 'test@sickkids.ca'

Rake::Task['survey:all'].invoke
Rake::Task['advice:all'].invoke
