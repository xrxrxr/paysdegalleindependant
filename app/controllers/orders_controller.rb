class OrdersController < ApplicationController
 
  def index
  end

  def show
  end

  def new
  	@amount = current_user.cart.total.to_i
  end

  def create
	  # Amount in cents
	  @amount = current_user.cart.total.to_i * 100



		puts 'Payeeeeeeeeeeeeeeeeeeeeeeee'
		o = Order.create(user: current_user, total: @amount/100)
		puts 'Order cree, un email sera envoye'
	  current_user.cart.cart_products.update_all(cartprodable_id: o.id, cartprodable_type: 'Order')
		puts 'cart vidE'
  end

end