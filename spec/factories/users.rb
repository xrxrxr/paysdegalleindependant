FactoryBot.define do
  factory :user do
    email { Faker::Internet.free_email }
    password { '#$taawktljasktlw4aaglj' }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
	username { Faker::FunnyName.name }
	is_admin { false }
  end
end