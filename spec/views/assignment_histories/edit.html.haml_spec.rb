require 'spec_helper'

describe "assignment_histories/edit" do
  before(:each) do
    @assignment_history = assign(:assignment_history, stub_model(AssignmentHistory,
      :checkout_id => "",
      :note => "MyString"
    ))
  end

  it "renders the edit assignment_history form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => assignment_histories_path(@assignment_history), :method => "post" do
      assert_select "input#assignment_history_checkout_id", :name => "assignment_history[checkout_id]"
      assert_select "input#assignment_history_note", :name => "assignment_history[note]"
    end
  end
end
