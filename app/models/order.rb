class Order < ApplicationRecord
  belongs_to :user
  has_many :cart_products, as: :cartprodable#, dependent: :destroy
end
