class Order < ApplicationRecord
  belongs_to :user
  has_many :cart_products, dependent: :destroy
end
