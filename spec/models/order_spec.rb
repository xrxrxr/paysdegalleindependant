require 'rails_helper'

RSpec.describe Order, type: :model do

  before(:each) do 
		@order = FactoryBot.create(:order)  	
  end

  it "has a valid factory" do
    expect(build(:order)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@order).to be_a(Order)
    end
  end
  
  context "public instance methods" do
    describe "product_quantity" do
      it { expect(@order).to respond_to(:product_quantity) }

      it "should return a number" do
		cart_product = FactoryBot.create(:cart_product, cartprodable: @order)

        expect(@order.product_quantity).to be_an(Integer)
      end

      it "should return the total" do
		cart_product = FactoryBot.create(:cart_product, cartprodable: @order)
		cart_product2 = FactoryBot.create(:cart_product, cartprodable: @order)

        expect(@order.product_quantity).to eq(2)
      end
    end
   end

  context "associations" do
    it { expect(@order).to belong_to(:user) }
    it { expect(@order).to have_many(:cart_products) }
  end
end



