require 'spec_helper'

describe "comments/new" do
  before(:each) do
    assign(:comment, stub_model(Comment,
      :notes => "MyText",
      :checkout => nil
    ).as_new_record)
  end

  it "renders new comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comments_path, :method => "post" do
      assert_select "textarea#comment_notes", :name => "comment[notes]"
      assert_select "input#comment_checkout", :name => "comment[checkout]"
    end
  end
end
