class CartsController < ApplicationController

	def show
		@cart = Cart.find_by(user: current_user)
		# @total = @cart.cart_products.map {|product| product.total}.sum.to_i
		@cart.update(total: @total)
		@products = @cart.products
	end

	def destroy
		current_user.cart.cart_products.destroy_all
	end
end
