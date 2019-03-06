# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



1.times do
	Category.create!(title: 'Jolis chatons')
	puts 'Category created'	
	Category.create!(title: 'Vilains chatons')
	puts 'Category created'	
	Category.create!(title: 'Chatons poilus')
	puts 'Category created'	
end

5.times do
	User.create!(first_name: Faker::Name.first_name,
				username: Faker::FunnyName.name,
				last_name: Faker::Name.last_name,
				email: Faker::Internet.email,
				password: '$#okdKd79fe')
	puts 'User created'
end

20.times do
	Product.create!(title: Faker::FunnyName.name,
					description: Faker::Lorem.paragraph,
					price: rand(10..20),
					pict_url: 'https://loremflickr.com/400/400/cat',
					category: Category.all.sample)
	puts 'Product created'
end
