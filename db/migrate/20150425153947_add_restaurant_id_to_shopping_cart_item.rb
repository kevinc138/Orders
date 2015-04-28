class AddRestaurantIdToShoppingCartItem < ActiveRecord::Migration
  def change
  	add_column :shopping_cart_items, :restaurant_id, :integer
  	add_column :shopping_cart_items, :restaurant_name, :string
  end
end
