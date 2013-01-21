require 'spec_helper'

describe "checkouts/show" do
  before(:each) do
    @checkout = assign(:checkout, stub_model(Checkout,
      :name => "Name",
      :quantity => 1,
      :user => nil,
      :item => nil,
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/Status/)
  end
end
