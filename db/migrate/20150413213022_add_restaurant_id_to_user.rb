class AddRestaurantIdToUser < ActiveRecord::Migration
  def change
  	add_column :users, :restaurantid, :integer
  end
end
