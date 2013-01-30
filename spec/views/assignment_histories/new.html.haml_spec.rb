require 'spec_helper'

describe "assignment_histories/new" do
  before(:each) do
    assign(:assignment_history, stub_model(AssignmentHistory,
      :checkout_id => "",
      :note => "MyString"
    ).as_new_record)
  end

  it "renders new assignment_history form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => assignment_histories_path, :method => "post" do
      assert_select "input#assignment_history_checkout_id", :name => "assignment_history[checkout_id]"
      assert_select "input#assignment_history_note", :name => "assignment_history[note]"
    end
  end
end
