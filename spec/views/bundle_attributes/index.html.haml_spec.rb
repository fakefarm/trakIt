require 'spec_helper'

describe "bundle_attributes/index" do
  before(:each) do
    assign(:bundle_attributes, [
      stub_model(BundleAttribute,
        :bundle_key => "Bundle Key",
        :bundle_value => "Bundle Value",
        :bundle_id => 1
      ),
      stub_model(BundleAttribute,
        :bundle_key => "Bundle Key",
        :bundle_value => "Bundle Value",
        :bundle_id => 1
      )
    ])
  end

  it "renders a list of bundle_attributes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Bundle Key".to_s, :count => 2
    assert_select "tr>td", :text => "Bundle Value".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
