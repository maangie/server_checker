class CreateCheckers < ActiveRecord::Migration
  def change
    create_table :checkers do |t|
      t.string :type

      t.timestamps
    end
  end
end
