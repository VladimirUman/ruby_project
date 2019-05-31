class UserMailer < ApplicationMailer
  default from: 'Sam Ruby <depot@example.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.received.subject
  #
  def send_password(user, password)
    @user = user
    @new_password = password
    mail to: user.email, subject: 'New password'
  end
end
