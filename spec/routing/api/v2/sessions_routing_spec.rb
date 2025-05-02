require "rails_helper"

RSpec.describe Api::V2::SessionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v2/sessions").to route_to("api/v2/sessions#index")
    end

    it "routes to #show" do
      expect(get: "/api/v2/sessions/1").to route_to("api/v2/sessions#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/api/v2/sessions").to route_to("api/v2/sessions#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/v2/sessions/1").to route_to("api/v2/sessions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/v2/sessions/1").to route_to("api/v2/sessions#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/v2/sessions/1").to route_to("api/v2/sessions#destroy", id: "1")
    end
  end
end
