FactoryBot.define do
  factory :order do
    total { 10 }
    user { FactoryBot.create(:user) }
  end
end
