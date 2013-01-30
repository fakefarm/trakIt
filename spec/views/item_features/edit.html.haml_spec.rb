require 'spec_helper'

describe "item_features/edit" do
  before(:each) do
    @item_feature = assign(:item_feature, stub_model(ItemFeature,
      :feature_key => "MyString",
      :feature_value => "MyString",
      :item_id => 1
    ))
  end

  it "renders the edit item_feature form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => item_features_path(@item_feature), :method => "post" do
      assert_select "input#item_feature_feature_key", :name => "item_feature[feature_key]"
      assert_select "input#item_feature_feature_value", :name => "item_feature[feature_value]"
      assert_select "input#item_feature_item_id", :name => "item_feature[item_id]"
    end
  end
end
