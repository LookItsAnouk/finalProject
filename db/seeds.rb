# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Migraine.destroy_all
User.destroy_all

PASSWORD ="test"

main_user = User.create(
    first_name: "anouk",
    last_name: "borris",
    email: "anouk@test.com",
    password: PASSWORD,
    meds_list: 'tylenol, advil',
    triggers_list: 'alcohol, bright lights',
    symptoms_list: 'nausea, eye pain, light sensitivity'

)
5.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name}@#{last_name}.com",
    password: PASSWORD,
    
    )
end

users = User.all

10.times do
    m = Migraine.create(
        migraine_date: 'Faker::Date.between(from: 25.days.ago, to: Date.today)',
        severity: 'mild'
        notes: 'Faker::Marketing.buzzwords'
        user_id: users.sample
    )
    if p.valid?
        rand(1..5).times do
            Comment.create(body: Faker::Hacker.say_something_smart, post: p, user: users.sample)
        end
    end

end

migraines = Migraine.all

puts "done generating"
