class UserNotifier < ApplicationMailer

  def send_notification_email(kudo)
    @kudo = kudo
    @giver = kudo.giver
    @comments = kudo.comments
    mail( :to => kudo.receiver.email, :subject => 'You got Kudos, yay!' )
  end

end
