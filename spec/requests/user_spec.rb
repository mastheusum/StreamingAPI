require 'rails_helper' 

RSpec.describe "Users", :type => :request do 
    let(:user) { User.create(email: Faker::Internet.email, password: "super123") }
    context "/REGISTRATION" do
        it "é válido quando enviado e-mail e senha retorna o código 201" do
            post "/api/v1/user/registration", params: { user: { email: Faker::Internet.email, password: "megamente" }}
            expect(response).to have_http_status 201
        end
        it "é válido quando os dados do usuário são retornados" do
            post "/api/v1/user/registration", params: { user: { email: Faker::Internet.email, password: "super123" }}
            body = JSON.parse(response.body)
            expect(body).to have_key("data")
            expect(body['data']).to have_key("user")
            expect(body['data']['user']).to have_key('email')
            expect(body['data']['user']).not_to have_key('password')
            expect(body['data']['user']).not_to have_key('password_digest')
        end
        it "é válido quando entre os dados do usuário é retornado o token de acesso" do
            post "/api/v1/user/registration", params: { user: { email: Faker::Internet.email, password: "super123" }}
            body = JSON.parse(response.body)
            expect(body).to have_key("data")
            expect(body['data']).to have_key("user")
            expect(body['data']['user']).to have_key('email')
            expect(body['data']['user']).to have_key('access_token')
        end
        it "é inválido quando enviado apenas a senha. O código retornado é 404" do
            post "/api/v1/user/registration", params: { user: { password: "megamente" }}
            body = JSON.parse(response.body)
            expect(response).to have_http_status 404
            expect(body).not_to have_key('data')
        end
        it "é inválido quando enviado apenas o e-mail. O código retornado é 404" do
            post "/api/v1/user/registration", params: { user: { email: user.email }}
            body = JSON.parse(response.body)
            expect(response).to have_http_status 404
            expect(body).not_to have_key('data')
        end
        it "é inválido quando o e-mail já está cadastrado. O código retornado é 409" do
            post "/api/v1/user/registration", params: { user: { email: user.email, password: "megamente" }}
            body = JSON.parse(response.body)
            expect(response).to have_http_status 409
            expect(body).not_to have_key('data')
        end
    end

    context "/UPDATE" do
        it "é válido caso a senha seja diferente ou não da já cadastrada" do
            put "/api/v1/user/update", params: { user: { email: user.email, password: "megamente", access_token: user.access_token }}
            expect(response).to have_http_status 202
        end
        it "é válido caso o token seja retornado" do
            put "/api/v1/user/update", params: { user: { email: user.email, password: user.password, access_token: user.access_token }}
            body = JSON.parse(response.body)
            expect(body).to have_key("data")
            expect(body["data"]).to have_key("user")
            expect(body["data"]['user']).to have_key("email")
            expect(body["data"]['user']).to have_key("access_token")
            expect(body["data"]['user']).not_to have_key("password")
            expect(body["data"]['user']).not_to have_key("password_digest")
        end
        it "é inválido caso o token esteja incorreto" do
            put "/api/v1/user/update", params: { user: { email: user.email, password: user.password, access_token: "2" }}
            body = JSON.parse(response.body)
            expect(response).to have_http_status 401
            expect(body).not_to have_key("data")
        end
        it "é inválido caso o e-mail não seja enviado" do
            put "/api/v1/user/update", params: { user: { password: user.password, access_token: user.access_token }}
            body = JSON.parse(response.body)
            expect(response).to have_http_status 404
            expect(body).not_to have_key("data")
        end
    end
end