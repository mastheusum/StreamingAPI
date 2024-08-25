require 'rails_helper' 
RSpec.describe User, :type => :model do 
    it "é válido quando o contém email e senha" do
        user = User.create(email: Faker::Internet.email, password: "senha123")
        expect(user).to be_valid
    end 
    it "é válido quando contém o token" do
        user = User.create(email: Faker::Internet.email, password: "senha123")
        expect(user.access_token).to be_present
    end
end