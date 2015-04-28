class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.decimal :price
      t.integer :quantity
      t.string :name

      t.timestamps null: false
    end
  end
end
