class Server < ActiveRecord::Base
  has_many :advisory
  validates :name, presence: true
end
