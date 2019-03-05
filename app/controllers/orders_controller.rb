class OrdersController < ApplicationController
  before_action :authenticate_user!
  after_create :order_email!

  def index
    @orders = current_user.orders
    @cart = Cart.find_by(user: current_user)
  end

  def show
    @order = Order.find(params[:id])
    @amount = @order.total
    @products = @order.cart_products.map{|cart_product| cart_product.product }
    @cart = Cart.find_by(user: current_user)
  end

  def new
    @amount = current_user.cart.total.to_i
    @cart = Cart.find_by(user: current_user)
    @products = @cart.products
  end

 def create
  # Amount in cents
  @amount = current_user.cart.total.to_i * 100

  customer = Stripe::Customer.create({
    email: params[:stripeEmail],
    source: params[:stripeToken],
  })

  charge = Stripe::Charge.create({
    customer: customer.id,
    amount: @amount,
    description: 'Rails Stripe customer',
    currency: 'eur',
  })

  puts 'Payeeeeeeeeeeeeeeeeeeeeeeee'
  o = Order.create(user: current_user, total: @amount/100)
  puts 'Order cree, un email sera envoye'
  current_user.cart.cart_products.update_all(cartprodable_id: o.id, cartprodable_type: 'Order')
  puts 'cart vidE'

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to orders_new_path
  end
end