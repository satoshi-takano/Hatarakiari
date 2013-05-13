class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :login_id
      t.string :login_password

      t.timestamps
    end
  end
end
