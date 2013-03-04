require 'spec_helper'

describe AssetsHelper do
  describe '#link_to_user' do 
    it 'links asset to proper user' do
      user = User.create(name: "dave")
      asset = SerialNumber.create( number: '1234',
                                  user_id: user.id,
                                )
      link_to_user(asset).should == "<a href=\"/users/1\">dave</a>"
    end
  end
end