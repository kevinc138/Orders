class AddPrecisionToItemPrice < ActiveRecord::Migration
  def change
  	reversible do |dir|
      change_table :items do |t|
        dir.up   { t.change :price, :decimal, precision: 6, scale: 2}
        dir.down { t.change :price, :decimal }
      end
    end
  end
end
