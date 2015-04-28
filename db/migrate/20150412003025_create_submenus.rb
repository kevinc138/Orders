class CreateSubmenus < ActiveRecord::Migration
  def change
    create_table :submenus do |t|
      t.string :name
      t.string :restaurant
      t.integer :restaurantId

      t.timestamps null: false
    end
  end
end
