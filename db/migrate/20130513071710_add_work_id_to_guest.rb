class AddWorkIdToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :work_id, :integer
  end
end
