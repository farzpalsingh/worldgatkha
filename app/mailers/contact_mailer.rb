class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_admin.subject
  #
  def contact_admin(message)
  	@name = message[:name]
  	@from = message[:email]
  	@subject = message[:subject]
    @body = message[:message]   

    mail(to: "moviesuncut1@gmail.com", from: @from, subject: @subject)
  end
end
