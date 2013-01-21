require "spec_helper"

describe SerialNumbersController do
  describe "routing" do

    it "routes to #index" do
      get("/serial_numbers").should route_to("serial_numbers#index")
    end

    it "routes to #new" do
      get("/serial_numbers/new").should route_to("serial_numbers#new")
    end

    it "routes to #show" do
      get("/serial_numbers/1").should route_to("serial_numbers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/serial_numbers/1/edit").should route_to("serial_numbers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/serial_numbers").should route_to("serial_numbers#create")
    end

    it "routes to #update" do
      put("/serial_numbers/1").should route_to("serial_numbers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/serial_numbers/1").should route_to("serial_numbers#destroy", :id => "1")
    end

  end
end
