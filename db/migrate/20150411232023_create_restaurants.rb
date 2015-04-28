class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.boolean :visible
      t.text :description
      t.string :logo

      t.timestamps null: false
    end
  end
end
