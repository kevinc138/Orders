class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price
      t.integer :submenuId
      t.integer :restaurantId

      t.timestamps null: false
    end
  end
end
