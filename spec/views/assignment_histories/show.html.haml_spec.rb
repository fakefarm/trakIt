require 'spec_helper'

describe "assignment_histories/show" do
  before(:each) do
    @assignment_history = assign(:assignment_history, stub_model(AssignmentHistory,
      :checkout_id => "",
      :note => "Note"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Note/)
  end
end
