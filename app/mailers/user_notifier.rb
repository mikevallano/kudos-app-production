class UserNotifier < ApplicationMailer

  def send_notification_email(kudo)
    @kudo = kudo
    @giver = kudo.giver
    @comments = kudo.comments
    @receiver = @kudo.receiver
    everyone = "everyone@goinflow.com", "everyone@conversioniq.com"
    mail( :to => @giver.email, :subject => "Kudos from #{@giver.name}!" )
  end

end
