FactoryBot.define do
  factory :cart_product do
    product { FactoryBot.create(:product) }
    cartprodable { FactoryBot.create(:cart) }
  end
end
