require 'spec_helper'

describe "serial_numbers/show" do
  before(:each) do
    @serial_number = assign(:serial_number, stub_model(SerialNumber,
      :number => "Number",
      :trackable => false,
      :item => nil,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Number/)
    rendered.should match(/false/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
