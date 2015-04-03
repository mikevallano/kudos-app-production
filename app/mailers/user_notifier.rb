class UserNotifier < ApplicationMailer

  def send_notification_email(current_user)
    @user = current_user
    mail( :to => current_user.email,
    :subject => 'You gave a kudo!' )
  end

end
