class CartProduct < ApplicationRecord
  belongs_to :product
  belongs_to :cartprodable, polymorphic: true

  validates :number, numericality: { greater_than_or_equal_to: 0 }
  
  def total
  	self.product.price * self.number
  end
end
