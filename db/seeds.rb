# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Event.destroy_all
users = []
10.times do
  password = Faker::Internet.password
  users << User.create!([{
                          name: Faker::Name.name,
                          email: Faker::Internet.email,
                          password: password,
                          password_confirmation: password
                        }])
end

Faker::Config.locale = :en
10.times do
  Event.create!([{
                  title: Faker::Book.title.chomp('.'),
                  description: Faker::Lorem.paragraph_by_chars(number: rand(180..235)),
                  location: Faker::Address.full_address,
                  start_time: Faker::Date.between(from: 2.days.ago, to: Date.today + 7.days),
                  end_time: Faker::Date.between(from: Date.today + 7.days, to: Date.today + rand(5..15).days),
                  creator_id: 1
                }])
end

users.each do |a|
  Event.all.each do |event|
    event.attendees << a
  end
end
# Event.second.image.attach(io: File.open(File.join(Rails.root,'app/assets/images/avatar.jpg')), filename: 'avatar.jpg')
p "Created #{Event.count} events"
