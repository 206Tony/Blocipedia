require 'random_data'

5.times do
	User.create!(
		email: RandomData.random_email,
		password: "password",
    standard: true,
    premium: false,
    admin: false
		)
	#user.save!
end

3.times do
  User.create!(
    email: RandomData.random_email,
    password: "password",
    standard: false,
    premium: true,
    admin: false
    )
end

2.times do
  User.create!(
    email: RandomData.random_email,
    password: "password",
    standard: false,
    premium: false,
    admin: true
    )
end
users = User.all

50.times do
  wiki = Wiki.create!(
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph,
      private: false,
      #user: User.last
  )

  wiki.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
end
wiki = Wiki.all



puts "Seed finished"
puts "#{users.count} users created"
puts "#{Wiki.count} wikis created"