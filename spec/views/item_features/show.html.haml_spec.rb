require 'spec_helper'

describe "item_features/show" do
  before(:each) do
    @item_feature = assign(:item_feature, stub_model(ItemFeature,
      :feature_key => "Feature Key",
      :feature_value => "Feature Value",
      :item_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Feature Key/)
    rendered.should match(/Feature Value/)
    rendered.should match(/1/)
  end
end
