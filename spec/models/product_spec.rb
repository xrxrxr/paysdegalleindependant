require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do 
		@product = FactoryBot.create(:product)  	
  end

  it "has a valid factory" do
    expect(build(:product)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@product).to be_a(Product)
    end
    describe "#title" do
      it {expect(@product).to validate_presence_of(:title)}
	end

    describe "#description" do
      it {expect(@product).to validate_presence_of(:description)}
	end

    describe "#price" do
      it {expect(@product).to validate_presence_of(:price)}
      it {expect(@product).to validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
      it {is_expected.to_not allow_value(-5).for(:price)}
	end

    describe "#pict_url" do
      it {expect(@product).to validate_presence_of(:pict_url)}
	end
  end

  context "associations" do
    it { expect(@product).to belong_to(:category) }
    it { expect(@product).to have_many(:cart_products) }
    it { expect(@product).to have_many(:carts) }
  end
end