require 'rails_helper' 
RSpec.describe Movie, :type => :model do 
    let(:movie) { Movie.create( title: Faker::Movie.title, description: Faker::Movie.quote,  genre: '{"ação", "aventura"}', thumbnail: Faker::LoremFlickr.image, duration: (60 + rand(120)).to_i , soundtrack: Faker::Music.band,  release_date: Faker::Date.birthday(min_age: 2, max_age: 65) ) }
    context "é válido" do
        let(:n_movie) { Movie.create( title: Faker::Movie.title, description: Faker::Movie.quote,  genre: '{"ação", "aventura"}', thumbnail: Faker::LoremFlickr.image, duration: (60 + rand(120)).to_i , soundtrack: Faker::Music.band, release_date: Faker::Date.birthday(min_age: 2, max_age: 65) ) }
        it "quando possui título" do
            expect(n_movie.title).to be_present
        end
        it "quando possui descrição" do
            expect(n_movie.description).to be_present
        end 
        it "quando possui gênero" do
            expect(n_movie.genre).to be_present
        end 
        it "quando possui thumbnail" do
            expect(n_movie.thumbnail).to be_present
        end
        it "quando possui duração" do
            expect(n_movie.duration).to be_present
        end 
        it "quando possui trilha sonora" do
            expect(n_movie.soundtrack).to be_present
        end
        it "quando possui data de lançamento" do
            expect(n_movie.release_date).to be_present
        end
    end
    it "é inválido se já existe um filme com o mesmo título" do
        m = Movie.create( title: movie.title, description: Faker::Movie.quote, genre: '{"ação", "aventura"}', thumbnail: Faker::LoremFlickr.image, duration: (60 + rand(120)).to_i , soundtrack: Faker::Music.band,  release_date: Faker::Date.birthday(min_age: 2, max_age: 65) )
        expect(m).not_to be_valid
    end
end