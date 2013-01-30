require 'spec_helper'

describe "asset_histories/index" do
  before(:each) do
    assign(:asset_histories, [
      stub_model(AssetHistory,
        :comments => "Comments",
        :serial_number_id => 1
      ),
      stub_model(AssetHistory,
        :comments => "Comments",
        :serial_number_id => 1
      )
    ])
  end

  it "renders a list of asset_histories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Comments".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
