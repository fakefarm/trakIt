require "spec_helper"

describe AssignmentHistoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/assignment_histories").should route_to("assignment_histories#index")
    end

    it "routes to #new" do
      get("/assignment_histories/new").should route_to("assignment_histories#new")
    end

    it "routes to #show" do
      get("/assignment_histories/1").should route_to("assignment_histories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/assignment_histories/1/edit").should route_to("assignment_histories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/assignment_histories").should route_to("assignment_histories#create")
    end

    it "routes to #update" do
      put("/assignment_histories/1").should route_to("assignment_histories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/assignment_histories/1").should route_to("assignment_histories#destroy", :id => "1")
    end

  end
end
