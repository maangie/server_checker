module ApplicationHelper
  # 指定されたサーバの全ての通知先に、サーバの通知先を送信する
  def send_server_status_to_advisories_helper(server)
    server.check_status
    emails = server.advisories.map(&:email)
    NoticeMailer.sendmail_confirm(emails, server).deliver
  end
end
