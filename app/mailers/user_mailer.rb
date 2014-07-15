class UserMailer < ActionMailer::Base
  default from: 'admin@painsquadapp.com'

  def pain_alert(user)
    @user = user
    mail to: user.healthcare_provider_email, subject: 'Severe Pain Alert'
  end

end