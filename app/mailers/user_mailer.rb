class UserMailer < ApplicationMailer

  default from: 'no-reply@perma-culture.fr'
 
  def welcome_email(user)
    @user = user 
    @url  = 'https://paysdegalleindependant.herokuapp.com/' 

    mail(to: @user.email, subject: 'Bienvenue sur perma-culture.org !') 
  end

end
