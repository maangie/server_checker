class AddServerToChecker < ActiveRecord::Migration
  def change
    add_column :checkers, :server_id, :integer
  end
end
