class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.string :name
      t.decimal :price

      t.timestamps null: false
    end
  end
end
