require 'rails_helper'

RSpec.describe "Api::V2::Users", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/api/v2/user/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/api/v2/user/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
