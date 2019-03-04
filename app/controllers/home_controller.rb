class HomeController < ApplicationController
	def index
		@products = Product.all
		@categories = Category.all
		respond_to do |format|
			format.html
			format.js
		end
	end
end
