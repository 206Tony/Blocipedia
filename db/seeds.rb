#require 'random_data'
include Faker


5.times do
	users = User.create!(
		#name: Faker::Name.name,
		email: Faker::Internet.email,
    password: "password"

		)
  
end
users = User.all 

20.times do
  wiki = Wiki.create!(
    user: users.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph  
  )
  #wikis.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
end
wikis = Wiki.all

admin = User.create!(
  #name: 'admin user',
  email: 'ant1@bloc.com',
  password: 'password',
  role: 'admin'
)

premium = User.create!(
  #name: 'premium user',
  email: 'premium@bloc.com',
  password: 'password',
  role: 'premium'
)

# standard = User.create!(
#   name: 'standard user'
#   email: 'standard@bloc.com'#,
#   # password: 'password',
#   # role: 'standard'
# )

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"