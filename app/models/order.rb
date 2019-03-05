class Order < ApplicationRecord
  belongs_to :user
  has_many :cart_products, as: :cartprodable#, dependent: :destroy

  def product_quantity
  	self.cart_products.map{|cart_product| cart_product.number}.sum
  end
end
