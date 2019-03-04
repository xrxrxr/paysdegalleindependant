class CartProduct < ApplicationRecord
  belongs_to :product
  belongs_to :cartprodable, polymorphic: true
  
  def total
  	self.product.price * self.number
  end
end
