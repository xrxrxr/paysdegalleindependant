class CartsController < ApplicationController
	before_action :authenticate_user!
	
	def index
	end

	def show
		# @cart defined in application_controller
		@cart.update(total: @total)
		@products = @cart.products
	end

	def destroy
		if current_user.cart.cart_products.destroy_all
			respond_to do |format|
				format.html {redirect_to cart_path(current_user.cart.id)}
				format.js
			end
		end
	end
end
