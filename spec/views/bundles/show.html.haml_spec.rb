require 'spec_helper'

describe "bundles/show" do
  before(:each) do
    @bundle = assign(:bundle, stub_model(Bundle,
      :label => "Label",
      :input => "Input"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Label/)
    rendered.should match(/Input/)
  end
end
