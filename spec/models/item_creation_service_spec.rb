require 'spec_helper'

describe ItemCreationService do

  let(:bundle) { Bundle.create({ name: 'Apple Computer' }) }

  let(:item_attributes) do
    { name: 'MacBook',
      quantity: 1,
      trackable: true,
      bundle_id: bundle.id
    }
  end

  describe '#item' do
    it "returns an Item with the attributes we passed in" do
      item_creation = ItemCreationService.new(item_attributes)
      item_creation.item.name.should == item_attributes[:name]
    end
  end

  describe '#save' do
    context 'item is invalid' do

      let(:item_creation) { ItemCreationService.new({}) }

      it 'does not save' do
        item_creation.save
        item_creation.item.persisted?.should == false
      end

      it 'returns a falsy value' do
        item_creation.save.should be_false
      end
    end

    context 'item is valid' do

      let(:item_creation) { ItemCreationService.new(item_attributes) }

      it 'will save' do
        item_creation.save
        item_creation.item.persisted?.should == true
      end 

      it 'will be truthy' do
        item_creation.save.should be_true
      end

      it 'converts Bundle attributes into Items attributes' do
        bundle_att = BundleAttribute.create({ bundle_key: "Screen",
                                              bundle_value: "Retina",
                                              bundle_id: bundle.id
                                             })
        item_creation.save
        item_feature = item_creation.item.item_features.first

        item_feature.feature_key.should == bundle_att.bundle_key
        item_feature.feature_value.should == bundle_att.bundle_value
      end

      context 'item is trackable' do
        it 'adds serial numbers' do
          item_creation.save
          item_creation.item.serial_numbers.count.should == 1
        end
      end

      context 'item is non-trackable' do
        it 'does not add serial numbers' do
          item_creation = ItemCreationService.new(item_attributes.merge({trackable: false}))
          item_creation.save
          item_creation.item.serial_numbers.count.should == 0
        end 
      end
    end
  end
end