require 'rails_helper' 
RSpec.describe Movie, :type => :request do 
    let(:user) { User.create!(email: Faker::Internet.email, password: "super123") }
    let(:movie) { Movie.first }
    context "/INDEX é válido quando" do
        it "é informado o token do usuário corretamente" do
            get "/api/v1/movies", params: { data: { user: { email: user.email, access_token: user.access_token } } }
            expect(response).to have_http_status 200
        end
        it "não é realizado pesquisa e retorna os filmes" do
            get "/api/v1/movies", params: { data: { user: { email: user.email, access_token: user.access_token } } }
            body = JSON.parse(response.body)
            expect(body).to have_key("data")
            expect(body["data"]).to have_key("user")
            expect(body["data"]).to have_key("movies")
        end
        it "é realizada uma pesquisa por título" do
            get "/api/v1/movies", params: { data: { user: { email: user.email, access_token: user.access_token }, q:{title_cont: "a"} } }
            body = JSON.parse(response.body)
            expect(body).to have_key("data")
            expect(body["data"]).to have_key("user")
            expect(body["data"]).to have_key("movies")
        end
        it "é realizada uma pesquisa por gênero" do
            get "/api/v1/movies", params: { data: { user: { email: user.email, access_token: user.access_token }, q:{genre_cont: "romance"} } }
            body = JSON.parse(response.body)
            expect(body).to have_key("data")
            expect(body["data"]).to have_key("user")
            expect(body["data"]).to have_key("movies")
        end
        it "é realizada uma pesquisa por ano" do
            get "/api/v1/movies", params: { data: { user: { email: user.email, access_token: user.access_token }, q:{release_date_eq: movie.release_date} } }
            body = JSON.parse(response.body)
            expect(body).to have_key("data")
            expect(body["data"]).to have_key("user")
            expect(body["data"]).to have_key("movies")
        end
        it "o token do usuário é retornado" do
            get "/api/v1/movies", params: { data: { user: { email: user.email, access_token: user.access_token } } }
            body = JSON.parse(response.body)
            expect(body).to have_key("data")
            expect(body["data"]).to have_key("user")
            expect(body["data"]['user']).to have_key("email")
            expect(body["data"]['user']).to have_key("access_token")
            expect(body["data"]['user']).not_to have_key("password")
            expect(body["data"]['user']).not_to have_key("password_digest")
        end
    end
    context "/INDEX é inválido caso" do
        it "o token do usuário esteja incorreto" do
            get "/api/v1/movies", params: { data: { user: { email: user.email, access_token: "2" } } }
            body = JSON.parse(response.body)
            expect(response).to have_http_status 401
            expect(body).not_to have_key("data")
            expect(body).not_to have_key("user")
            expect(body).not_to have_key("email")
            expect(body).not_to have_key("access_token")
            expect(body).not_to have_key("password")
            expect(body).not_to have_key("password_digest")
            expect(body).not_to have_key("movies")
        end
        # it "o resultado da pesquisa por título incluir algum filme que não contém o conteúdo pesquisado"
        # it "o resultado da pesquisa caso algum dos filmes retornado não contenha o gênero pesquisado"
        # it "o resultado da pesquisa contenha algum filme que não seja do ano pesquisado"
    end
end