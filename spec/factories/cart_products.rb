FactoryBot.define do
  factory :cart_product do
    product { FactoryBot.create(:user) }
    cartprodable { FactoryBot.create(:cart) }
  end
end
