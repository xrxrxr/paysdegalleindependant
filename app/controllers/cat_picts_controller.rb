class CatPictsController < ApplicationController
	def create
		@product = Product.find(params[:product_id])
		@product.cat_picts.attach(params[:cat_picts])
	end
end
