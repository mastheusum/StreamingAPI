require 'rails_helper' 

RSpec.describe "Sessions", :type => :request do 
    let(:user) { User.create(email: Faker::Internet.email, password: "super123") }
    context "/CREATE" do
        it "é válido quando enviado email e senha corretos" do
            post "/api/v1/session/create", params: { user: { email: user.email, password: user.password}}
            expect(response).to have_http_status 200
        end
        it "é válido quando os dados do usuário são retornados" do
            post "/api/v1/session/create", params: { user: { email: user.email, password: user.password}}
            body = JSON.parse(response.body)
            expect(body).to have_key("data")
            expect(body['data']).to have_key("user")
            expect(body['data']['user']).not_to have_key("password")
            expect(body['data']['user']).not_to have_key("password_digest")
        end
        it "é válido quando, entre os dados do usuário, é retornado o token de acesso" do
            post "/api/v1/session/create", params: { user: { email: user.email, password: user.password}}
            body = JSON.parse(response.body)
            expect(body).to have_key("data")
            expect(body['data']).to have_key("user")
            expect(body['data']['user']).to have_key("email")
            expect(body['data']['user']).to have_key("access_token")
        end
        it "é inválido quando enviado apenas a senha" do
            post "/api/v1/session/create", params: { user: { password: "megamente" }}
            body = JSON.parse(response.body)
            expect(response).to have_http_status 404
            expect(body).not_to have_key("data")
            expect(body).not_to have_key("email")
        end
        it "é inválido quando enviado apenas o email" do
            post "/api/v1/session/create", params: { user: { email: user.email }}
            body = JSON.parse(response.body)
            expect(response).to have_http_status 404
            expect(body).not_to have_key("data")
            expect(body).not_to have_key("user")
        end
    end

    context "/DESTOY" do
        it "é válido caso email e token sejam enviados corretamente" do
            delete "/api/v1/session/destroy", params: { user: { email: user.email, access_token: user.access_token } }
            body = JSON.parse(response.body)
            expect(response).to have_http_status 200
            expect(body).not_to have_key("data")
            expect(body).not_to have_key("user")
        end
        it "é inválido caso o User seja retornado" do
            delete "/api/v1/session/destroy", params: { user: { email: user.email, access_token: user.access_token } }
            body = JSON.parse(response.body)
            expect(body).not_to have_key("data")
            expect(body).not_to have_key("user")
        end
        it "é inválido caso o Token seja retornado" do
            delete "/api/v1/session/destroy", params: { user: { email: user.email, access_token: user.access_token }}
            body = JSON.parse response.body
            expect(body).not_to have_key("data")
            expect(body).not_to have_key("access_token")
        end
        it "é inválido caso o token enviado esteja incorreto" do
            delete "/api/v1/session/destroy", params: { user: { email: user.email, access_token: "2" }}
            body = JSON.parse response.body
            expect(response).to have_http_status 401
            expect(body).not_to have_key("data")
            expect(body).not_to have_key("email")
            expect(body).not_to have_key("access_token")
        end
        it "é inválido caso o e-mail não seja enviado" do
            delete "/api/v1/session/destroy", params: { user: { access_token: user.access_token }}
            body = JSON.parse response.body
            expect(response).to have_http_status 404
            expect(body).not_to have_key("data")
            expect(body).not_to have_key("email")
            expect(body).not_to have_key("access_token")
        end
        it "é inválido caso o e-mail não seja válido" do
            delete "/api/v1/session/destroy", params: { user: { access_token: user.access_token }}
            body = JSON.parse response.body
            expect(response).to have_http_status 404
            expect(body).not_to have_key("data")
            expect(body).not_to have_key("email")
            expect(body).not_to have_key("access_token")
        end
    end
end