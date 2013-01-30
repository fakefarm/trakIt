require 'spec_helper'

describe "assignment_histories/index" do
  before(:each) do
    assign(:assignment_histories, [
      stub_model(AssignmentHistory,
        :checkout_id => "",
        :note => "Note"
      ),
      stub_model(AssignmentHistory,
        :checkout_id => "",
        :note => "Note"
      )
    ])
  end

  it "renders a list of assignment_histories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Note".to_s, :count => 2
  end
end
