require 'net/http'

# サーバ
class Server < ActiveRecord::Base
  has_many :advisories
  validates :name, presence: true
  validates :check_type, inclusion: { in: 1..2 }

  # 状態を確認する
  def check_status
    http = Net::HTTP.new(name, 80)
    http.open_timeout = 3
    http.read_timeout = 3

    @status = http.request_head('/')
  rescue Timeout::Error
    @status = Net::HTTPResponse.new(nil, 408, $ERROR_INFO.cause.to_s)
  ensure
    http.finish if http.started?
  end

  # 状態を得る
  def status
    @status ||= check_status
  end
end
