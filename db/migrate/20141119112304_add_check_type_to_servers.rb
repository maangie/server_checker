class AddCheckTypeToServers < ActiveRecord::Migration
  def change
    add_column :servers, :check_type, :integer
  end
end
