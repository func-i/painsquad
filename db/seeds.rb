User.destroy_all
User.create! username: 'test user', email: 'test@uhn.com', password: 'password', healthcare_provider_email: 'test@uhn.com'
User.create! username: 'matt emmons', email: 'mattwhat@live.com', password: 'password', healthcare_provider_email: 'mattwhat@live.com'

Rake::Task['survey:all'].invoke
Rake::Task['advice:all'].invoke
