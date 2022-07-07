class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_us_email.subject
  #
  def contact_us_email(contact)
    @contact = contact
    mail(:to => Rails.application.credentials.gmail[:user_name],
         :subject => "MyEmotionへの問い合わせ")
  end
end
