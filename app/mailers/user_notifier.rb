class UserNotifier < ApplicationMailer

  def send_notification_email(kudo)
    @kudo = kudo
    @giver = kudo.giver
    @comments = kudo.comments
    @receivers = @kudo.receivers
    @everyone = "everyone@goinflow.com", "everyone@conversioniq.com"
    mail( :to => @everyone, :from => @giver.email, :subject => "Kudos to: #{@receivers}!" )
  end

end
