require 'open-uri'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :avatar
  before_create :grab_image

  after_create :welcome_send
  after_create :create_cart

  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy

  #validates :username, uniqueness: true

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def grab_image
    downloaded_image = (open('https://loremflickr.com/g/400/400/face/'))
    self.avatar.attach(io: downloaded_image, filename: 'image.png')
  end

  def create_cart
    Cart.create!(user: self)
  end
end
