class CartItem < ActiveRecord::Base
	attr_reader :product, :quantity

	belongs_to :cart

	def initialize
		self.quantity = 1
	end

	def increment_quantity
		@quantity += 1
	end
	
	def name
		return self.name
	end
	
	def price
		return self.price*self.quantity
	end
end
