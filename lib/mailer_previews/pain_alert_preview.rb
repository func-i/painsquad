class PainAlertPreview < ActionMailer::Preview

  # Accessible from http://localhost:3000/rails/mailers/pain_alert/pain_alert
  def pain_alert
    UserMailer.pain_alert(User.first)
  end

end