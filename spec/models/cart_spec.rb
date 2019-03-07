require 'rails_helper'

RSpec.describe Cart, type: :model do

  before(:each) do 
		@cart = FactoryBot.create(:cart) 
  end

  it "has a valid factory" do
    expect(build(:cart)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@cart).to be_a(Cart)
    end
  end

  context "public instance methods" do
    describe "total" do
      it { expect(@cart).to respond_to(:total) }

      it "should return a number" do
		cart_product = FactoryBot.create(:cart_product, cartprodable: @cart)

        expect(@cart.total).to be_an(Integer)
      end

      it "should return the total" do
		cart_product = FactoryBot.create(:cart_product, cartprodable: @cart)
		cart_product2 = FactoryBot.create(:cart_product, cartprodable: @cart)

        expect(@cart.total).to eq(20)
      end
    end

    describe "total_items" do
      it { expect(@cart).to respond_to(:total_items) }

      it "should return a number" do
		cart_product = FactoryBot.create(:cart_product, cartprodable: @cart)

        expect(@cart.total_items).to be_an(Integer)
      end

      it "should return the total" do
		cart_product = FactoryBot.create(:cart_product, cartprodable: @cart)
		cart_product2 = FactoryBot.create(:cart_product, cartprodable: @cart)

        expect(@cart.total_items).to eq(2)
      end
    end
   end


  context "associations" do
    it { expect(@cart).to have_many(:cart_products) }
    it { expect(@cart).to have_many(:products) }
  end
end
