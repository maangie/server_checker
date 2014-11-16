require 'net/http'

# サーバ
class Server < ActiveRecord::Base
  has_many :advisories
  validates :name, presence: true

  # 状態を確認する
  def check_status
    @status = Net::HTTP.get_response(name, '/')
  end

  # 状態を得る
  def status
    @status ||= check_status
  end
end
