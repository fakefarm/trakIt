require 'spec_helper'

describe "tags/new" do
  before(:each) do
    assign(:tag, stub_model(Tag,
      :label => "MyString",
      :input => "MyString",
      :item => nil
    ).as_new_record)
  end

  it "renders new tag form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tags_path, :method => "post" do
      assert_select "input#tag_label", :name => "tag[label]"
      assert_select "input#tag_input", :name => "tag[input]"
      assert_select "input#tag_item", :name => "tag[item]"
    end
  end
end
