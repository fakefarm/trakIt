require 'spec_helper'

describe SerialNumbersHelper do
  describe '#assigned_user_to_serial_number' do
    it "provides user name associated to serial number" do 
      serial_number =  SerialNumber.create(number: '1234', user_id: 1)
      assigned_user_to_serial_number(serial_number).should == 'dave'
    end
    it 'returns nil if user name is nil' do
      serial_number =  SerialNumber.create(number: '1234')
      assigned_user_to_serial_number(serial_number).should be_nil
    end
  end

  describe "#serial_no" do
    it "provides user name associated to serial number" do 
      item = Item.create(name: 'MacBook', quantity: 1)
      @serial_number =  SerialNumber.create(number: '1234', item_id: item.id)
      serial_no.should == 'MacBook'
    end
    it "returns nil if serial number item name is nil" do 
      # Is this the right way to create nil here, based code? ( name: nil )
      item = Item.create(name: nil, quantity: 1)
      @serial_number =  SerialNumber.create(number: '1234', item_id: item.id)
      serial_no.should == nil
    end
  end 
end