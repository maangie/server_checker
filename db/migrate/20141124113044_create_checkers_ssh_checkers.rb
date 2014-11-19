class CreateCheckersSshCheckers < ActiveRecord::Migration
  def change
    create_table :checkers_ssh_checkers do |t|
      t.text :command

      t.timestamps
    end
  end
end
