class Product < ApplicationRecord
has_one_attached :cat_picts
after_save :grab_image

  belongs_to :category
  has_many :cart_products, dependent: :destroy
  has_many :carts, through: :cart_products, source: :product

  def grab_image    
    downloaded_image = (open('https://loremflickr.com/400/400/cat'))
    self.cat_picts.attach(io: downloaded_image, filename: "image.png")
  end
end
