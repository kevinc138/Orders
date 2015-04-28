class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :restaurant_id
      t.integer :user_id
      t.decimal :total

      t.timestamps null: false
    end
  end
end
