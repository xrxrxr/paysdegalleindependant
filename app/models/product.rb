class Product < ApplicationRecord
  has_one_attached :cat_picts
  after_save :grab_image

  belongs_to :category
  has_many :cart_products, dependent: :destroy
  has_many :carts, through: :cart_products, source: :product

  validates :title, presence: true
  validates :description, presence: true
  validates :price, 
    presence: true,
    numericality: { greater_than_or_equal_to: 0 }
  validates :pict_url, presence: true


  def grab_image    
    downloaded_image = (open(self.pict_url))
    self.cat_picts.attach(io: downloaded_image, filename: "image.png")
  end

  def get_cart_product_related_to(cartprodable)
    self.cart_products.find_by(cartprodable: cartprodable)
  end

  def get_order_product_related_to(cartprodable)
  	self.cart_products.find_by(cartprodable_type: "Order", cartprodable_id: cartprodable)
  end
end
