Rails.application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.raise_delivery_errors = true

  smtp_settings = Hash.new
  smtp_settings[:enable_starttls_auto] = true
  smtp_settings[:address] = 'smtp.gmail.com'
  smtp_settings[:port] = '587'
  smtp_settings[:domain] = 'smtp.gmail.com'
  smtp_settings[:authentication] = 'plain'
  smtp_settings[:user_name] = Rails.application.secrets.mail['name']
  smtp_settings[:password] = Rails.application.secrets.mail['password']

  config.action_mailer.smtp_settings = smtp_settings
end
