# TODO: http://shirusu-ni-tarazu.hatenablog.jp/entry/2012/11/04/173742
# TODO: http://easyramble.com/invalid-single-table-inheritance-type.html

class Checker < ActiveRecord::Base
  belongs_to :server
  validates :type, inclusion: { in: ['HTTP', 'SSH'] }
end
