require "spec_helper"

describe BundleAttributesController do
  describe "routing" do

    it "routes to #index" do
      get("/bundle_attributes").should route_to("bundle_attributes#index")
    end

    it "routes to #new" do
      get("/bundle_attributes/new").should route_to("bundle_attributes#new")
    end

    it "routes to #show" do
      get("/bundle_attributes/1").should route_to("bundle_attributes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/bundle_attributes/1/edit").should route_to("bundle_attributes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/bundle_attributes").should route_to("bundle_attributes#create")
    end

    it "routes to #update" do
      put("/bundle_attributes/1").should route_to("bundle_attributes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bundle_attributes/1").should route_to("bundle_attributes#destroy", :id => "1")
    end

  end
end
