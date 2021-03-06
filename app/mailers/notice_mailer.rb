class NoticeMailer < ActionMailer::Base
  default from: Rails.application.secrets.mail['name']

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_confirm.subject
  #
  def sendmail_confirm(to, server)
    @server = server
    mail to: to
  end
end
