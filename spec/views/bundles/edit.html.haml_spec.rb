require 'spec_helper'

describe "bundles/edit" do
  before(:each) do
    @bundle = assign(:bundle, stub_model(Bundle,
      :label => "MyString",
      :input => "MyString"
    ))
  end

  it "renders the edit bundle form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bundles_path(@bundle), :method => "post" do
      assert_select "input#bundle_label", :name => "bundle[label]"
      assert_select "input#bundle_input", :name => "bundle[input]"
    end
  end
end
