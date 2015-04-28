class AddItemIdToCartItem < ActiveRecord::Migration
  def change
  	add_column :cart_items, :item_id, :integer
  end
end
