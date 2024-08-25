# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

generos = [ "ação", "aventura", "romance", "comédia", "drama", "terror" ]

20.times do
    g = []
    (1 + rand(4)).to_i.times do
        g.append generos[rand(generos.size).to_i]
    end
    Movie.create!( 
        title: Faker::Movie.title, description: Faker::Movie.quote,  
        genre: "{ \"#{g.join("\",\"")}\" }", thumbnail: Faker::LoremFlickr.image, 
        duration: (60 + rand(120)).to_i , soundtrack: Faker::Music.band,  
        release_date: Faker::Date.birthday(min_age: 2, max_age: 65) 
    )
end