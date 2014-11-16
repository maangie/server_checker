class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :basic # http://altarf.net/computer/rails/2477

  private

  # Basic 認証
  def basic
    return if Rails.env.test?

    authenticate_or_request_with_http_basic do |user, pass|
      secrets = Rails.application.secrets
      user == secrets.admin_user && pass == secrets.admin_pass
    end
  end
end
