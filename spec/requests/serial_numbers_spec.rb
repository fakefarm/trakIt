require 'spec_helper'

describe "SerialNumbers" do
  describe "GET /serial_numbers" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get serial_numbers_path
      response.status.should be(200)
    end
  end
end
