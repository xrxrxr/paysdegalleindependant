require 'open-uri'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  before_save :grab_image

  has_one :cart
  has_many :orders

  def grab_image
    downloaded_image = (open('http://loremflickr.com/300/300/'))
    self.avatar.attach(io: downloaded_image, filename: 'image.png')
  end
end
