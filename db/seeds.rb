# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Idea.destroy_all
User.destroy_all

PASSWORD = "123"
rand(10..15).times do
    User.create({
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: PASSWORD
    })
end
users = User.all

50.times do
    created_at = Faker::Date.backward(days:365 * 3)
    updated_at = Faker::Date.backward(days:365 * 2)

    Idea.create(
        title: Faker::Lorem.word,
        body: Faker::Lorem.paragraph,
        created_at: created_at,
        updated_at: updated_at,
        user: users.sample
    )
end

ideas = Idea.all

puts Cowsay.say("Generated #{ideas.count} ideas", :cow)
puts Cowsay.say("Generated #{users.count} user", :dragon)