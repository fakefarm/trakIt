require 'spec_helper'

describe "user_comments/new" do
  before(:each) do
    assign(:user_comment, stub_model(UserComment,
      :user_id => 1,
      :comment => "MyString"
    ).as_new_record)
  end

  it "renders new user_comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_comments_path, :method => "post" do
      assert_select "input#user_comment_user_id", :name => "user_comment[user_id]"
      assert_select "input#user_comment_comment", :name => "user_comment[comment]"
    end
  end
end
