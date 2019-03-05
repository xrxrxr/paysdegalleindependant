class AdminMailer < ApplicationMailer
	default from: 'no-reply@perma-culture.fr'
 
  def order_email(user)
    @admin = admin 
    @url  = 'https://paysdegalleindependant.herokuapp.com/' 

    mail(to: @admin.email, subject: 'Vous avez une nouvelle commande sur perma-culture.org !') 
  end

end
