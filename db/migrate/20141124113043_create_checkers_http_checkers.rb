class CreateCheckersHttpCheckers < ActiveRecord::Migration
  def change
    create_table :checkers_http_checkers do |t|

      t.timestamps
    end
  end
end
