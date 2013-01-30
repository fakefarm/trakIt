require "spec_helper"

describe ItemFeaturesController do
  describe "routing" do

    it "routes to #index" do
      get("/item_features").should route_to("item_features#index")
    end

    it "routes to #new" do
      get("/item_features/new").should route_to("item_features#new")
    end

    it "routes to #show" do
      get("/item_features/1").should route_to("item_features#show", :id => "1")
    end

    it "routes to #edit" do
      get("/item_features/1/edit").should route_to("item_features#edit", :id => "1")
    end

    it "routes to #create" do
      post("/item_features").should route_to("item_features#create")
    end

    it "routes to #update" do
      put("/item_features/1").should route_to("item_features#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/item_features/1").should route_to("item_features#destroy", :id => "1")
    end

  end
end
