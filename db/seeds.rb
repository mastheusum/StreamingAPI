# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

generos = [ "ação", "aventura", "romance", "comédia", "drama", "terror" ]
filmes = [
  "https://www.youtube.com/watch?v=TbLVc8fnw7c",
  "https://www.youtube.com/watch?v=ohQ1IZmce5w",
  "https://www.youtube.com/watch?v=QqmbrvluQRA",
  "https://www.youtube.com/watch?v=yAZxx8t9zig",
  "https://www.youtube.com/watch?v=cyogqjxlZb8",
  "https://www.youtube.com/watch?v=dEbe0rS4Z2A",
  "https://www.youtube.com/watch?v=-po4UGNn9iY",
  "https://www.youtube.com/watch?v=a3ZpvVHpNEE",
  "https://www.youtube.com/watch?v=piMSNmTmvnI",
  "https://www.youtube.com/watch?v=YhrA6hjQbTw",
  "https://www.youtube.com/watch?v=4Cp7Nr9cujc",
  "https://www.youtube.com/watch?v=wA1HxFw2Xhk",
  "https://www.youtube.com/watch?v=l_mkh4oRNDE",
  "https://www.youtube.com/watch?v=NmTPDA15lPA",
  "https://www.youtube.com/watch?v=seSIJf5mhPE",
  "https://www.youtube.com/watch?v=kI_NVzqeLDA",
  "https://www.youtube.com/watch?v=oSdv5mB0Xm4",
  "https://www.youtube.com/watch?v=ZCHT7HCtikI",
  "https://www.youtube.com/watch?v=-Eu7XVppK6Q",
  "https://www.youtube.com/watch?v=6FNyGVadKmM",
]

filmes.each do |link|
    g = []
    (1 + rand(4)).to_i.times do
        g.append generos[rand(generos.size).to_i]
    end
    t = Faker::Movie.title
    while Movie.find_by title: t
      puts ">> #{t}"
      t = Faker::Movie.title
    end
    Movie.create!( 
        title: t, 
        description: Faker::Movie.quote,  
        genre: "{ \"#{g.join("\",\"")}\" }", 
        thumbnail: Faker::LoremFlickr.image, 
        movie_url: link,
        duration: (60 + rand(120)).to_i , 
        soundtrack: Faker::Music.band,  
        release_date: Faker::Date.birthday(min_age: 2, max_age: 65) 
    )
end