require 'spec_helper'

describe ItemsHelper do
  describe '#link_to_user' do 
    it 'links item to proper user' do
      item = SerialNumber.create( number: '1234',
                                  user_id: 1,
                                )
      link_to_user(item).should == "<a href=\"/users/1\">dave</a>"
    end
  end
end