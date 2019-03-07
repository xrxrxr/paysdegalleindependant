class OrderMailer < ApplicationMailer
	
	default from: 'no-reply@perma-culture.fr'
	
	def order_email_user(user)
		@user = user 
		@cart = @user.cart
		@products = @user.cart.products

		@url  = 'https://paysdegalleindependant.herokuapp.com/' 

		mail(to: @user.email, subject: 'Votre commande sur perma-culture.org !') 
	end

	def order_email_admin(user)
		@user = user 
		@cart = @user.cart
		@products = @user.cart.products

		@url  = 'https://paysdegalleindependant.herokuapp.com/' 

		mail(to: 'orders-paysdegalle@yopmail.com', subject: 'Un utilisateur viens de passer une commande !')
	end
end
