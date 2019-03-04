class CartProductsController < ApplicationController

	def create
		puts '### cartproductcreate ###'
		puts params
		puts '############'
		cp = CartProduct.find_by(product:Product.find(params[:product_id]), cartprodable: Cart.find_by(user: current_user))
		if cp
			@cart_product = cp
			@cart_product.number += 1
		else
			@cart_product = CartProduct.new(product:Product.find(params[:product_id]), cartprodable: Cart.find_by(user: current_user))
		end

		if @cart_product.save
			respond_to do |format|
				format.html do
					flash[:notice] = 'Product added'
					redirect_to root_path
				end
				format.js
			end
		else
			flash[:alert] = 'ERROR'
			redirect_to root_path
		end
	end

	def update
		puts '############## update cartproduct ################'
		puts params
		puts '#' *60
		@cart_product = set_cart_product
		if params[:update]
			@cart_product.number += 1
		elsif params[:destroy]
			@cart_product.number -= 1
		end
			if @cart_product.save
				respond_to do |format|
					format.html do
						flash[:notice] = 'Product added'
						redirect_to root_path
					end
					format.js
				end
			else
				flash[:alert] = 'ERROR'
				redirect_to root_path
			end
	end

	def destroy
		puts '############## destroy cartproduct ################'
		puts params
		puts '#' *60
		@cart_product = set_cart_product
		@cart_product.destroy
			respond_to do |format|
					format.html
					format.js
			end
	end

private
	def set_cart_product
		CartProduct.find_by(cartprodable: Cart.find(params[:id]), product: Product.find(params[:product_id]))
	end
end
