#require 'random_data'
include Faker


5.times do
	users = User.create!(
		#name: Faker::Name.name,
		email: Faker::Internet.email,
    password: "password"
	)
end

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

users = User.all 

20.times do
  wiki = Wiki.create!(
    user: users.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph, 
    private: false 
  )

end
wikis = Wiki.all

20.times do
  collaborator = Collaborator.create!(
      user: users.sample,
      wiki: wikis.sample
    )
end
collaborators = Collaborator.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
puts "#{Collaborator.count} collaborators created"