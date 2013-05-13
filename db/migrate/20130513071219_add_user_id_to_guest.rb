class AddUserIdToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :user_id, :integer
  end
end
