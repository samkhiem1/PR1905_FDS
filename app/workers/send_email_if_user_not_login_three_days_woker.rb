class SendEmailIfUserNotLoginThreeDaysWoker
  include Sidekiq::Worker

  def perform
    User.all.each do |user|
      if (Time.zone.today  - user.last_sign_in_at.to_date).to_i > 3
        SendEmailIfUserNotLoginThreeDaysMailer.send_email(user).deliver
      end
    end
  end
end
