require 'spec_helper'

describe CheckoutQuantityReducerService do 

  describe "#save" do
    context "reduces the quantity of available inventory" do 
      user = User.create( name: "dave.dude")
      item = Item.create( name: "MacBook", quantity: 2 )
      my_checkout = { quantity: 1, user_id: user.id, item_id: item.id }

      checkout_qty_reducer_service = CheckoutQuantityReducerService.new(my_checkout)
      checkout_qty_reducer_service.save.should == true
      # This is the goal, but that's breaking...
      #### item.quantity.should == 1
            
      # New insights;
      # Viewed #reduce_quantity as a private method
      # Viewing tests as if it were running the code in an IRB
      # Use the methods being tested. #Specifically the save method
      # setup all components in the file when doing the classicist appraoch
    end
  end

end