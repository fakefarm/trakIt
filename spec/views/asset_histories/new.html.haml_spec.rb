require 'spec_helper'

describe "asset_histories/new" do
  before(:each) do
    assign(:asset_history, stub_model(AssetHistory,
      :comments => "MyString",
      :serial_number_id => 1
    ).as_new_record)
  end

  it "renders new asset_history form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => asset_histories_path, :method => "post" do
      assert_select "input#asset_history_comments", :name => "asset_history[comments]"
      assert_select "input#asset_history_serial_number_id", :name => "asset_history[serial_number_id]"
    end
  end
end
