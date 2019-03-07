class CartProductsController < ApplicationController

	def create
		does_exist ? does_exist.number += 1 : @cart_product = CartProduct.new(product:Product.find(params[:product_id]), cartprodable: @cart)

		if @cart_product.save
			respond_to do |format|
				format.html do
					flash[:notice] = 'Product added'
					redirect_to product_path(params[:product_id])
				end
				format.js
			end
		else
			flash[:alert] = 'ERROR'
			redirect_to root_path
		end
	end

	def update
		@cart_product = set_cart_product

		params[:update] ? @cart_product.number += 1 : params[:destroy] ? @cart_product.number -= 1 : return
		
			if @cart_product.save
				respond_to do |format|
					format.html do
						flash[:notice] = 'Product added'
						redirect_to cart_path(current_user.cart.id)
					end
					format.js
				end
			else
				flash[:alert] = 'ERROR'
				redirect_to cart_path(current_user.cart.id)
			end
	end

	def destroy
		@cart_product = set_cart_product

		@cart_product.destroy
			respond_to do |format|
					format.html
					format.js
			end
	end

private

	def set_cart_product
		CartProduct.find_by(cartprodable: @cart, product: Product.find(params[:product_id]))
	end
end
