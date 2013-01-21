require 'spec_helper'

describe "checkouts/index" do
  before(:each) do
    assign(:checkouts, [
      stub_model(Checkout,
        :name => "Name",
        :quantity => 1,
        :user => nil,
        :item => nil,
        :status => "Status"
      ),
      stub_model(Checkout,
        :name => "Name",
        :quantity => 1,
        :user => nil,
        :item => nil,
        :status => "Status"
      )
    ])
  end

  it "renders a list of checkouts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
