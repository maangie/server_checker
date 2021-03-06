module ApplicationHelper
  # 指定されたサーバの全ての通知先に、サーバの通知先を送信する
  def send_server_status_to_advisories_helper(server, &check_send)
    server.check_status
    return unless check_send.call(server.status.code)
    emails = server.advisories.map(&:email)
    NoticeMailer.sendmail_confirm(emails, server).deliver
  end
end
