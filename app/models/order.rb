class Order < ApplicationRecord
  belongs_to :user
  has_many :cart_products, as: :cartprodable#, dependent: :destroy
  after_create :order_user_send, :order_admin_send

  def product_quantity
  	self.cart_products.map{|cart_product| cart_product.number}.sum
  end

  def order_admin_send
    OrderMailer.order_email_admin(@user.is_admin).deliver_now
  end

  def order_user_send
  	OrderMailer.order_email_user(self.user).deliver_now
  end
end
