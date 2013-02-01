require 'spec_helper'

describe "bundle_attributes/new" do
  before(:each) do
    assign(:bundle_attribute, stub_model(BundleAttribute,
      :bundle_key => "MyString",
      :bundle_value => "MyString",
      :bundle_id => 1
    ).as_new_record)
  end

  it "renders new bundle_attribute form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bundle_attributes_path, :method => "post" do
      assert_select "input#bundle_attribute_bundle_key", :name => "bundle_attribute[bundle_key]"
      assert_select "input#bundle_attribute_bundle_value", :name => "bundle_attribute[bundle_value]"
      assert_select "input#bundle_attribute_bundle_id", :name => "bundle_attribute[bundle_id]"
    end
  end
end
