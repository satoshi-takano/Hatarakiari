class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :name
      t.string :client
      t.decimal :year
      t.string :charge
      t.string :url
      t.boolean :private_work
      t.string :description

      t.timestamps
    end
  end
end
