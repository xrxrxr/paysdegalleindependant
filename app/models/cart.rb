class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_products, as: :cartprodable
  has_many :products, through: :cart_products#,source :cartprodable

  def total
  	self.cart_products.map {|product| product.total}.sum.to_i
  end
end
