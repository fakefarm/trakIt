require 'spec_helper'

describe "bundle_attributes/show" do
  before(:each) do
    @bundle_attribute = assign(:bundle_attribute, stub_model(BundleAttribute,
      :bundle_key => "Bundle Key",
      :bundle_value => "Bundle Value",
      :bundle_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Bundle Key/)
    rendered.should match(/Bundle Value/)
    rendered.should match(/1/)
  end
end
