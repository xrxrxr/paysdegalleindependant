FactoryBot.define do
  factory :category do
    title { Faker::FunnyName.name }
  end
end
