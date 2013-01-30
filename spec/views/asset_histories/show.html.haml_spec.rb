require 'spec_helper'

describe "asset_histories/show" do
  before(:each) do
    @asset_history = assign(:asset_history, stub_model(AssetHistory,
      :comments => "Comments",
      :serial_number_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Comments/)
    rendered.should match(/1/)
  end
end
