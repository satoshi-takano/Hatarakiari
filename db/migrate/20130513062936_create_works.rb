class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :name
      t.string :client
      t.integer :year
      t.string :role
      t.text :description
      t.boolean :private_work
      t.string :url

      t.timestamps
    end
  end
end
