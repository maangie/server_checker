class NoticeMailer < ActionMailer::Base
  binding.pry
  default from: Rails.application.secrets.mail['name']

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_confirm.subject
  #
  def sendmail_confirm(to)
    @greeting = 'Hi'

    mail to: to
  end
end
