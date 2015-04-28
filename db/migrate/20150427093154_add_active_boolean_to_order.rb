class AddActiveBooleanToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :active, :boolean
  end
end
