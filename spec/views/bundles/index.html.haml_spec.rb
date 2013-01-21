require 'spec_helper'

describe "bundles/index" do
  before(:each) do
    assign(:bundles, [
      stub_model(Bundle,
        :label => "Label",
        :input => "Input"
      ),
      stub_model(Bundle,
        :label => "Label",
        :input => "Input"
      )
    ])
  end

  it "renders a list of bundles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Label".to_s, :count => 2
    assert_select "tr>td", :text => "Input".to_s, :count => 2
  end
end
