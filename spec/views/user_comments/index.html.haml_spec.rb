require 'spec_helper'

describe "user_comments/index" do
  before(:each) do
    assign(:user_comments, [
      stub_model(UserComment,
        :user_id => 1,
        :comment => "Comment"
      ),
      stub_model(UserComment,
        :user_id => 1,
        :comment => "Comment"
      )
    ])
  end

  it "renders a list of user_comments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Comment".to_s, :count => 2
  end
end
