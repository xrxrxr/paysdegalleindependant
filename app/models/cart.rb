class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_products, as: :cartprodable
  has_many :products, through: :cart_products#,source :cartprodable

  def total
  	self.cart_products.map {|product| product.total}.sum.to_i
  end

  def total_items
   	self.cart_products.map {|cp| cp.number}.sum
  end
end
