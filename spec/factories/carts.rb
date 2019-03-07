FactoryBot.define do
  factory :cart do
    total { 10 }
    subtotal { 10 }
    user { FactoryBot.create(:user) }
  end
end
