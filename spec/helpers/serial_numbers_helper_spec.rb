require 'spec_helper'

describe SerialNumbersHelper do
  describe '#assigned_user_to_serial_number' do
    it "provides user name associated to serial number" do 
      user = User.create(name: "dave")
      serial_number =  SerialNumber.create(number: '1234', user_id: user.id)
      assigned_user_to_serial_number(serial_number).should == 'dave'
    end
    it 'returns nil if user name is nil' do
      serial_number =  SerialNumber.create(number: '1234')
      assigned_user_to_serial_number(serial_number).should be_nil
    end
  end

  describe "#serial_no" do
    it "provides user name associated to serial number" do 
      asset = Asset.create(name: 'MacBook', quantity: 1)
      @serial_number =  SerialNumber.create(number: '1234', asset_id: asset.id)
      serial_no.should == 'MacBook'
    end
    it "returns nil if serial number asset name is nil" do 
      # Is this the right way to create nil here, based code? ( name: nil )
      asset = Asset.create(name: nil, quantity: 1)
      @serial_number =  SerialNumber.create(number: '1234', asset_id: asset.id)
      serial_no.should == nil
    end
  end 
end