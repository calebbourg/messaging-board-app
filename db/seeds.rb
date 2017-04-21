# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



puts "****** creating users.....******"

20.times do 
	User.create!(email: Faker::Internet.unique.email, password: 'password')
end

puts "******** users created********"


puts "********* creating posts....********"

300.times do 
	User.all.sample.posts.create!(title: Faker::Beer.name, body: Faker::Book.title)
end

puts "******** posts created********"
puts "*********** creating comments*******"
500.times do 
   Comment.create!(body: Faker::Food.ingredient, user_id: User.all.sample.id, post_id: Post.all.sample.id)
end

puts "******** comments created********"