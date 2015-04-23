class UserNotifier < ApplicationMailer

  def send_notification_email(kudo)
    @kudo = kudo
    @giver = kudo.giver
    @comments = kudo.comments
    @receiver = @kudo.receiver
    everyone = "everyone@goinflow.com", "everyone@conversioniq.com"
    mail( :to => @receiver.email, :subject => "Kudos to #{@receiver.name.titlecase}!" )
  end

end
