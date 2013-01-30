require 'spec_helper'

describe "asset_histories/edit" do
  before(:each) do
    @asset_history = assign(:asset_history, stub_model(AssetHistory,
      :comments => "MyString",
      :serial_number_id => 1
    ))
  end

  it "renders the edit asset_history form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => asset_histories_path(@asset_history), :method => "post" do
      assert_select "input#asset_history_comments", :name => "asset_history[comments]"
      assert_select "input#asset_history_serial_number_id", :name => "asset_history[serial_number_id]"
    end
  end
end
