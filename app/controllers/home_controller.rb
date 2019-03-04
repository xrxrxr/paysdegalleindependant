class HomeController < ApplicationController
<<<<<<< HEAD
	def index
		@products = Product.all
		@categories = Category.all
		respond_to do |format|
			format.html
			format.js
		end
	end
=======
    def index
        @products = Product.all
        @categories = Category.all
        respond_to do |format|
            format.html
            format.js
        end
    end
>>>>>>> master
end
