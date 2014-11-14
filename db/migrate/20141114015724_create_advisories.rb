class CreateAdvisories < ActiveRecord::Migration
  def change
    create_table :advisories do |t|
      t.references :server, index: true
      t.string :email

      t.timestamps
    end
  end
end
