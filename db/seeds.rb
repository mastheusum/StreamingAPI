# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# generos = [ "ação", "aventura", "romance", "comédia", "drama", "terror" ]

# 20.times do
#     g = []
#     (1 + rand(4)).to_i.times do
#         g.append generos[rand(generos.size).to_i]
#     end
#     Movie.create!( 
#         title: Faker::Movie.title, description: Faker::Movie.quote,  
#         genre: "{ \"#{g.join("\",\"")}\" }", thumbnail: Faker::LoremFlickr.image, 
#         duration: (60 + rand(120)).to_i , soundtrack: Faker::Music.band,  
#         release_date: Faker::Date.birthday(min_age: 2, max_age: 65) 
#     )
# end

filmes = [
  {
    title: "Galactic Voyage",
    description: "A thrilling space adventure following a crew of explorers on a journey through uncharted galaxies.",
    genre: "Sci-Fi",
    thumbnail: "https://example.com/images/galactic_voyage.jpg",
    duration: 120,
    soundtrack: "Galaxies Beyond",
    release_date: "2024-07-15"
  },
  {
    title: "Mystery at Midnight",
    description: "In a quiet town, a detective uncovers a web of secrets after a mysterious disappearance.",
    genre: "Mystery",
    thumbnail: "https://example.com/images/mystery_midnight.jpg",
    duration: 98,
    soundtrack: "The Darkened Path",
    release_date: "2023-11-03"
  },
  {
    title: "The Last Sorcerer",
    description: "A young mage embarks on a quest to find the last sorcerer in the world and unlock ancient magic.",
    genre: "Fantasy",
    thumbnail: "https://example.com/images/last_sorcerer.jpg",
    duration: 135,
    soundtrack: "Echoes of Magic",
    release_date: "2022-09-21"
  },
  {
    title: "Ocean's Whisper",
    description: "A heartfelt drama about a marine biologist who discovers a rare dolphin species and fights to protect it.",
    genre: "Drama",
    thumbnail: "https://example.com/images/oceans_whisper.jpg",
    duration: 112,
    soundtrack: "Songs of the Sea",
    release_date: "2021-06-10"
  },
  {
    title: "Speed Limit Zero",
    description: "A high-octane action movie following a skilled driver who gets entangled in an international chase.",
    genre: "Action",
    thumbnail: "https://example.com/images/speed_limit_zero.jpg",
    duration: 105,
    soundtrack: "Fast Lane",
    release_date: "2023-03-14"
  },
  {
    title: "Through the Looking Glass",
    description: "A young girl discovers a hidden world in her family's attic mirror and faces magical challenges.",
    genre: "Adventure",
    thumbnail: "https://example.com/images/looking_glass.jpg",
    duration: 118,
    soundtrack: "Reflections",
    release_date: "2023-12-22"
  },
  {
    title: "Artificial Dreams",
    description: "In a dystopian future, an android begins to question its purpose and explores forbidden emotions.",
    genre: "Sci-Fi",
    thumbnail: "https://example.com/images/artificial_dreams.jpg",
    duration: 130,
    soundtrack: "Machine Heartbeat",
    release_date: "2025-05-09"
  },
  {
    title: "Ghosts of Yesterday",
    description: "A horror film about a group of friends who uncover haunted relics with ties to their dark pasts.",
    genre: "Horror",
    thumbnail: "https://example.com/images/ghosts_yesterday.jpg",
    duration: 100,
    soundtrack: "Whispers from the Past",
    release_date: "2024-10-31"
  },
  {
    title: "The Forgotten Melody",
    description: "A romance about two musicians who rediscover an old song and their feelings for each other.",
    genre: "Romance",
    thumbnail: "https://example.com/images/forgotten_melody.jpg",
    duration: 95,
    soundtrack: "Lost Harmonies",
    release_date: "2022-02-14"
  },
  {
    title: "Eternal Winter",
    description: "An animated film following a polar bear family surviving in a harsh and magical winterland.",
    genre: "Animation",
    thumbnail: "https://example.com/images/eternal_winter.jpg",
    duration: 85,
    soundtrack: "Winter's Embrace",
    release_date: "2021-12-01"
  }
]

filmes.each do |filme|
  Movie.create!( filme )
end