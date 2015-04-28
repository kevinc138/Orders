class AddTotalToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :subtotal, :decimal
  	add_column :orders, :tax, :decimal
  end
end
