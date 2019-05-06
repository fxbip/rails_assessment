# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

skills = ["Singing", "Acting", "Improv", "Clowning", "Balloonist", "Acrobatics", "Magic", "Belly Dancing", "Ballet", "Comedy", "Drag", "Flair Bartending", "Hypnosis", "Guitar", "Drums", "Storytelling", "Ventriloquism", "Charicatures", "Adult Entertainment", "Juggling", "Mime"]

if Skill.count == 0
    skills.sort.each do |skill|
        Skill.create(skills: skill)
        puts "created #{skill}"
    end
end

users = []
40.times do |i|
    

     user = User.create(
         first_name: Faker::Name.first_name, 
         last_name: Faker::Name.last_name,
         email: Faker::Internet.email,
         date_of_birth: Faker::Date.birthday(18, 65),
         contact_number: Faker::PhoneNumber.cell_phone,
         country: Faker::Address.country,
         state: Faker::Address.state,
         city: Faker::Address.city,
         postcode: Faker::Address.postcode,
         suburb: Faker::Address.city,
         password: "test123",
         password_confirmation: "test123"
     )

     users.push user


    puts "created #{i}"

end

if Mentor.count == 0
    saved_skills = Skill.all
    for i in 1..4
        random_user = users[rand users.length]
        mentor = Mentor.create(
            rate: Faker::Number.number(4),
            about_me: Faker::GreekPhilosophers.quote,
            user_id: random_user.id
        )
        p mentor
        while mentor.skills.count < 3
            random_skill = saved_skills[rand saved_skills.length]
            if mentor.skills.where(id: random_skill.id).length == 0
                mentor.skills.push random_skill
                p "created mentor #{mentor.id} with skill #{random_skill.id}"
            end
        end
    end
end
