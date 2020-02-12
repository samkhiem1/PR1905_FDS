class SendEmailIfUserNotLoginThreeDaysMailer < ApplicationMailer
  def send_email user
    @user = user
    mail to: @user.email, title: "Email"
  end
end
