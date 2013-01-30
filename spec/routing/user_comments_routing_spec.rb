require "spec_helper"

describe UserCommentsController do
  describe "routing" do

    it "routes to #index" do
      get("/user_comments").should route_to("user_comments#index")
    end

    it "routes to #new" do
      get("/user_comments/new").should route_to("user_comments#new")
    end

    it "routes to #show" do
      get("/user_comments/1").should route_to("user_comments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user_comments/1/edit").should route_to("user_comments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user_comments").should route_to("user_comments#create")
    end

    it "routes to #update" do
      put("/user_comments/1").should route_to("user_comments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user_comments/1").should route_to("user_comments#destroy", :id => "1")
    end

  end
end
