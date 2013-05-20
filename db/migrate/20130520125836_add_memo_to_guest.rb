class AddMemoToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :memo, :string
  end
end
