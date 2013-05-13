class RemoveUserIdToGuest < ActiveRecord::Migration
  def up
    remove_column :guests, :user_id
  end

  def down
    add_column :guests, :user_id, :integer
  end
end
