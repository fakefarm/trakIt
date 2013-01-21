require 'spec_helper'

describe "serial_numbers/index" do
  before(:each) do
    assign(:serial_numbers, [
      stub_model(SerialNumber,
        :number => "Number",
        :trackable => false,
        :item => nil,
        :user => nil
      ),
      stub_model(SerialNumber,
        :number => "Number",
        :trackable => false,
        :item => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of serial_numbers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
