require "#{Rails.root}/app/helpers/application_helper"
include ApplicationHelper
namespace :mail do
  desc 'サーバの状態を送信する'
  task status_of_servers: :environment do
    puts 'start...'

    Server.all.each do |server|
      send_server_status_to_advisories_helper(server, nil)
    end

    puts 'end.'
  end

  desc 'サーバの状態が OK 以外だったら送信する'
  task status_of_servers_without_ok: :environment do
    puts 'start...'

    Server.all.each do |server|
      send_server_status_to_advisories_helper(server, '200')
    end

    puts 'end.'
  end
end
