class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome_email.subject
  #
  default from: 'no-reply@supachai.com'
  def welcome_email
    @greeting = "Hi"
    @user = User.find(params[:user_id])
    mail to: @user.mail
  end
end
