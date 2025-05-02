require 'rails_helper'

RSpec.describe "Api::V2::Movies", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v2/movie/index"
      expect(response).to have_http_status(:success)
    end
  end

end
