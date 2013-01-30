require 'spec_helper'

describe "item_features/index" do
  before(:each) do
    assign(:item_features, [
      stub_model(ItemFeature,
        :feature_key => "Feature Key",
        :feature_value => "Feature Value",
        :item_id => 1
      ),
      stub_model(ItemFeature,
        :feature_key => "Feature Key",
        :feature_value => "Feature Value",
        :item_id => 1
      )
    ])
  end

  it "renders a list of item_features" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Feature Key".to_s, :count => 2
    assert_select "tr>td", :text => "Feature Value".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
