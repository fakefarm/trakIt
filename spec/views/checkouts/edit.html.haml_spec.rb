require 'spec_helper'

describe "checkouts/edit" do
  before(:each) do
    @checkout = assign(:checkout, stub_model(Checkout,
      :name => "MyString",
      :quantity => 1,
      :user => nil,
      :item => nil,
      :status => "MyString"
    ))
  end

  it "renders the edit checkout form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => checkouts_path(@checkout), :method => "post" do
      assert_select "input#checkout_name", :name => "checkout[name]"
      assert_select "input#checkout_quantity", :name => "checkout[quantity]"
      assert_select "input#checkout_user", :name => "checkout[user]"
      assert_select "input#checkout_item", :name => "checkout[item]"
      assert_select "input#checkout_status", :name => "checkout[status]"
    end
  end
end
