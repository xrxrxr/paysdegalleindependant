class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
    @amount = @order.total
    @products = @order.cart_products.map{|cart_product| cart_product.product }
  end

  def new
    @amount = current_user.cart.total.to_i
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

  o = Order.create(user: current_user, total: @amount/100)
  @cart.cart_products.update_all(cartprodable_id: o.id, cartprodable_type: 'Order')

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to orders_new_path
  end
end