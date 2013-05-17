class AddImagesToWork < ActiveRecord::Migration
  def change
    add_attachment :works, :image_0, :image_1, :image_2, :image_3, :image_4
  end
end
