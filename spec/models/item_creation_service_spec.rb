# Notes;
# Classisist approach needs to instantiate everything
# Tried to do exist but didn't pass

require 'spec_helper'

describe ItemCreationService do

  describe '#item' do

    it "returns an Item with the attributes we passed in" do
        
      @bundle = Bundle.create({ name: 'testyees' })

      @bundle_att = BundleAttribute.create({ bundle_key: "string",
                                             bundle_value: "string",
                                             bundle_id: @bundle.id
                                           })

      @item_attributes = { name: 'foo',
                           quantity: 1,
                           trackable: false,
                           bundle_id: @bundle.id
                         }

      item_creation = ItemCreationService.new(@item_attributes)
      item_creation.save
      
      item_creation.item.should #return #<Item id: 15, name: "foo", quantity: 1, bundle_id: 2, trackable: false, created_at: "2013-02-25 22:39:48", updated_at: "2013-02-25 22:39:48">

      # what is that format? 
      # why doesn't this work:
      # item_creation.should exist
    end
  end
  
  describe '#save' do

    context 'item is invalid' do
      # We passed attributes to the creation service that produce validation errors on item
      it 'does not save' do
        # @item_creation = ItemCreationService.new({...})
        # @item_creation.persisted?
        # @item_creation.item.persisted?.should == false

        @bundle = Bundle.create({ name: 'testyees' })

        @bundle_att = BundleAttribute.create({ bundle_key: "string",
                                               bundle_value: "string",
                                               bundle_id: @bundle.id
                                             })

        @item_attributes = { name: 'foo',
                             trackable: false,
                             bundle_id: @bundle.id
                           }

        item_creation = ItemCreationService.new(@item_attributes)
        item_creation.save
        item_creation.item.persisted?.should == false
      end

      it 'returns false' do
        
        @bundle = Bundle.create({ name: 'testyees' })

        @bundle_att = BundleAttribute.create({ bundle_key: "string",
                                               bundle_value: "string",
                                               bundle_id: @bundle.id
                                             })

        @item_attributes = { name: 'foo',
                             trackable: false,
                             bundle_id: @bundle.id
                           }

        item_creation = ItemCreationService.new(@item_attributes)
        
        item_creation.save.should == nil # is nil same as false?
      end
    end

    context 'item is valid' do
      context 'item is trackable' do
        it 'will save' do
          @bundle = Bundle.create({ name: 'testyees' })

          @bundle_att = BundleAttribute.create({ bundle_key: "string",
                                                 bundle_value: "string",
                                                 bundle_id: @bundle.id
                                               })

          @item_attributes = { name: 'foo',
                               quantity: 1,
                               trackable: false,
                               bundle_id: @bundle.id
                             }

          item_creation = ItemCreationService.new(@item_attributes)
          item_creation.save
          item_creation.item.persisted?.should == true
        end 

        it 'will return true' do
          @bundle = Bundle.create({ name: 'testyees' })

          @bundle_att = BundleAttribute.create({ bundle_key: "string",
                                                 bundle_value: "string",
                                                 bundle_id: @bundle.id
                                               })

          @item_attributes = { name: 'foo',
                               quantity: 1,
                               trackable: false,
                               bundle_id: @bundle.id
                             }

          item_creation = ItemCreationService.new(@item_attributes)
          item_creation.save.should  == true
        end


        it 'adds serial numbers' do
          @bundle = Bundle.create({ name: 'testyees' })

          @bundle_att = BundleAttribute.create({ bundle_key: "string",
                                                 bundle_value: "string",
                                                 bundle_id: @bundle.id
                                               })

          @item_attributes = { name: 'foo',
                               quantity: 1,
                               trackable: true,
                               bundle_id: @bundle.id
                             }

          item_creation = ItemCreationService.new(@item_attributes)
          item_creation.save
          item_creation.item.serial_numbers.count.should == 1
        end

        it 'converts Bundle attributes into Items attributes' do
          @bundle = Bundle.create({ name: 'testyees' })

          @bundle_att = BundleAttribute.create({ bundle_key: "string",
                                                 bundle_value: "string",
                                                 bundle_id: @bundle.id
                                               })

          @item_attributes = { name: 'foo',
                               quantity: 1,
                               trackable: true,
                               bundle_id: @bundle.id
                             }

          item_creation = ItemCreationService.new(@item_attributes)
          item_creation.save
          item_creation.item.item_features[0].feature_key.should == @bundle_att.bundle_key
        end
      end

      context 'item is non-trackable' do
        it 'does not add serial numbers' do
          @bundle = Bundle.create({ name: 'testyees' })

          @bundle_att = BundleAttribute.create({ bundle_key: "string",
                                                 bundle_value: "string",
                                                 bundle_id: @bundle.id
                                               })

          @item_attributes = { name: 'foo',
                               quantity: 1,
                               trackable: false,
                               bundle_id: @bundle.id
                             }

          item_creation = ItemCreationService.new(@item_attributes)
          item_creation.save
          item_creation.item.serial_numbers.count.should == 0
        end 
      end
    end
  end
end




    # it 'has Item attributes' do
    #   @attributes = { name: 'foo', quantity: 1, trackable: true, bundle_id: 1 }
    #   item = Item.new(@attributes)
    #   item.name.should == 'foo'
    # end

    # it 'calls the add_serial_numbers method' do
    #   @attributes = { id: 1, name: 'foo', quantity: 1, trackable: true, bundle_id: 1 }
    #   item = Item.new(@attributes)
    #   item.save
    #   # mocking attempt;
      
    #   serial_numb.item_id.should be 1
      
    #   # Goal;
    #   # To create an item, save it, and stub a serial number class. Then, assign serial number to the new item and see if the serial number was successfully assigned to the item. 

    #   # Questions
    #   ##### 1. How should I test that this method is firing?
    #   ##### item.save.should receive(:add_serial_numbers) 
    #   ##### Should I be testing that a method calls another method?
    #   # 2. Or, should I test the output instead?
    # end




































