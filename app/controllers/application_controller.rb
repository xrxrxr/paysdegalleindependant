class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :get_cart

protected

	def configure_permitted_parameters
	   devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email])
	end

	def get_cart
		if current_user && user_signed_in?
			@cart = Cart.find_by(user: current_user)
		end
	end
end
