class Cart < ActiveRecord::Base
	has_many :cartItems, dependent: :destroy

	def initialize
		@items = []
	end

	def add_product

		@items.each do |cartItemId|
			
			
		end
		#CartItem.new(:cart_id => self.id, :item_id => )
	end

	def total_price
		return @items.sum { |item| item.price}
	end
end
