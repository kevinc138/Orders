class Restaurant < ActiveRecord::Base
	has_many :orders
	has_one :location
end
