require 'spec_helper'

describe "tags/index" do
  before(:each) do
    assign(:tags, [
      stub_model(Tag,
        :label => "Label",
        :input => "Input",
        :item => nil
      ),
      stub_model(Tag,
        :label => "Label",
        :input => "Input",
        :item => nil
      )
    ])
  end

  it "renders a list of tags" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Label".to_s, :count => 2
    assert_select "tr>td", :text => "Input".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
