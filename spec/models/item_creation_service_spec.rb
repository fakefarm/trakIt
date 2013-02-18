require 'spec_helper'

describe "ItemCreationService" do

  describe "#save" do
    describe "A saved ItemCreationService instance" do
      it "has Item attributes" do
        attributes = { name: "foo", quantity: 1, trackable: true, bundle_id: 1}
        item = Item.new(attributes)
        item.name.should == "foo"
      end
    end
  end

  describe "#add_bundle_attributes" do

  end

  describe "#add_serial_numbers" do

  end

end
