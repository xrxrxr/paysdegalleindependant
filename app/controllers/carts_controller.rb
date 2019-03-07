class CartsController < ApplicationController
	# before_action :authenticate_user!
	def create
		puts 'cart create #########################3'
		if session[:cart_id]
	      cart = Cart.find(session[:cart_id])
	      cart.update(user: self)
	    else
	      Cart.create!(user: self)
	    end
	end

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
