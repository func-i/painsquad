User.destroy_all
User.create! username: 'test user', email: 'test@uhn.com', password: 'password'
User.create! username: 'matt emmons', email: 'mattwhat@live.com', password: 'password', healthcare_provider_email: 'mattwhat@live.com'
