require 'rails_helper'

RSpec.describe CartProduct, type: :model do

  before(:each) do 
		@cart_product = FactoryBot.create(:cart_product) 
  end

  it "has a valid factory" do
    expect(build(:cart_product)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@cart_product).to be_a(CartProduct)
    end

    describe "#number" do
      it {expect(@cart_product).to validate_numericality_of(:number).is_greater_than_or_equal_to(0) }
      it {is_expected.to_not allow_value(-5).for(:number)}
      it {is_expected.to allow_value(0).for(:number)}
      it {is_expected.to allow_value(15).for(:number)}
	end
  end

  context "public instance methods" do
    describe "total" do
      it { expect(@cart_product).to respond_to(:total) }

      it "should return the total" do
		cart_product = FactoryBot.create(:cart_product, number:4)

        expect(cart_product.total.to_i).to eq(40)
      end
    end
  end

  context "associations" do
    it { expect(@cart_product).to belong_to(:cartprodable) }
    it { expect(@cart_product).to belong_to(:product) }
  end
end