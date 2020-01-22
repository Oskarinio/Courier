# Create a main sample user.
User.create!(name:  "Adm1n",
             email: "admin@mail.org",
             password:              "godlike",
             password_confirmation: "godlike",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

# Generate a bunch of additional users.
10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@mail.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end

# Generate microposts for a subset of users.
users = User.order(:created_at).take(6)
50.times do
  adress = Faker::Address.street_address
  users.each { |user| user.packages.create!(adress: adress) }
end
