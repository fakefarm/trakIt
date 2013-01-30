require 'spec_helper'

describe "user_comments/show" do
  before(:each) do
    @user_comment = assign(:user_comment, stub_model(UserComment,
      :user_id => 1,
      :comment => "Comment"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Comment/)
  end
end
