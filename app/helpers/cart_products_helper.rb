module CartProductsHelper
	
	def does_exist
		CartProduct.find_by(product:Product.find(params[:product_id]), cartprodable: @cart) ? @cart_product = CartProduct.find_by(product:Product.find(params[:product_id]), cartprodable: @cart) : false
	end
end
