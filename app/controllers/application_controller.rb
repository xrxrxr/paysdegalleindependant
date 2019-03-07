class ApplicationController < ActionController::Base
	include CartProductsHelper
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :get_cart


protected

	def configure_permitted_parameters
	   devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email])
	end

	def get_cart
		if current_user && user_signed_in?
			@cart = Cart.find_by(user: current_user)
		elsif session[:cart_id]
			@cart = Cart.find(session[:cart_id])
		else 
			c = Cart.create
			session[:cart_id] = c.id
			@cart = Cart.find(session[:cart_id])
		end
	end
end
