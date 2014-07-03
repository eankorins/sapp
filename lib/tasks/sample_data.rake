namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		admin = User.create!(name: "Kim Jong Un",
							 email: "leader@bestkorea.com",
							 password: "basketball",
							 password_confirmation: "basketball",
							 admin: true)
		User.create!(name: "Example User",
					 email: "example@railstutorial.org",
					 password: "foobar",
					 password_confirmation: "foobar")
	99.times do |n|
		name = Faker::Name.name
		email = "Example-#{n+1}@railstutorial.org"
		password = "foobar"
		User.create!(name: name, email: email, password: password, password_confirmation: password)
	end
end
end