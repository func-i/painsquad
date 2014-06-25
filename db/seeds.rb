# [User, Advice, Recommendation, Step].each &:destroy_all
User.destroy_all

user = User.create username: 'test user', email: 'test@user.com', password: 'password'
