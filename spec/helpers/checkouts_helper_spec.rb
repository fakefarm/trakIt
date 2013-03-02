require 'spec_helper'

describe CheckoutsHelper do
  describe '#checkout_dates' do
    it 'provides an array of dates' do
      checkout_dates.class.should == Array
    end

    it 'formatted for easy date selection of 1 week to 6 months' do
      checkout_dates.first.should == ['1 week',"#{1.week.from_now}"]
      checkout_dates.last.should == ['6 months',"#{6.months.from_now}"]
    end
  end

  describe '#due_date' do
    it 'formats date' do
       checkout = Checkout.new(quantity: 1, 
                               user_id: 1, 
                               item_id: 1, 
                               due_date: "2013-03-02 10:29:06 -0700"
                              )
      due_date(checkout).should == "March  2"
    end
  end

  describe '#remaining_time_of_rental' do
    it 'formats time into words' do
       checkout = Checkout.new(quantity: 1, 
                               user_id: 1, 
                               item_id: 1, 
                               due_date: "2013-03-02 10:29:06 -0700"
                              )
      remaining_time_of_rental(checkout).should == "15 minutes"
    end
  end

end