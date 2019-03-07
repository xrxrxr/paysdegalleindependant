FactoryBot.define do
  factory :product do
    title { Faker::FunnyName.name }
    description { Faker::Lorem.paragraph }
    price { rand(10..20) }
    pict_url { 'https://loremflickr.com/400/400/cat' }
    category { FactoryBot.create(:category) }
  end
end