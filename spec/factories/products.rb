FactoryBot.define do
  factory :product do
    title { Faker::FunnyName.name }
    description { Faker::Lorem.paragraph }
    price { 10 }
    pict_url { 'https://loremflickr.com/400/400/cat' }
    category { FactoryBot.create(:category) }
  end
end