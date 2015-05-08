require "#{Rails.root}/app/helpers/application_helper"
include ApplicationHelper
namespace :mail do
  desc 'サーバの状態を送信する'
  task status_of_servers: :environment do
    puts 'start...'

    Server.all.each do |server|
      send_server_status_to_advisories_helper(server) { |status| true }
    end

    puts 'end.'
  end

  desc 'サーバのレスポンスが 4xx, 5xx だったら送信する'
  task status_of_servers_without_ok: :environment do
    puts 'start...'

    Server.all.each do |server|
      send_server_status_to_advisories_helper(server) do |status|
        return status >= 400 && status <= 599
      end
    end

    puts 'end.'
  end
end
