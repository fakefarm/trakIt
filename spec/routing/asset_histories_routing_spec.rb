require "spec_helper"

describe AssetHistoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/asset_histories").should route_to("asset_histories#index")
    end

    it "routes to #new" do
      get("/asset_histories/new").should route_to("asset_histories#new")
    end

    it "routes to #show" do
      get("/asset_histories/1").should route_to("asset_histories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/asset_histories/1/edit").should route_to("asset_histories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/asset_histories").should route_to("asset_histories#create")
    end

    it "routes to #update" do
      put("/asset_histories/1").should route_to("asset_histories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/asset_histories/1").should route_to("asset_histories#destroy", :id => "1")
    end

  end
end
