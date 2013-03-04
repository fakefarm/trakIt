require 'spec_helper'

describe AssetCreationService do

  let(:bundle) { Bundle.create({ name: 'Apple Computer' }) }

  let(:asset_attributes) do
    { name: 'MacBook',
      quantity: 1,
      trackable: true,
      bundle_id: bundle.id
    }
  end

  describe '#asset' do
    it "returns an Asset with the attributes we passed in" do
      asset_creation = AssetCreationService.new(asset_attributes)
      asset_creation.asset.name.should == asset_attributes[:name]
    end
  end

  describe '#save' do
    context 'asset is invalid' do

      let(:asset_creation) { AssetCreationService.new({}) }

      it 'does not save' do
        asset_creation.save
        asset_creation.asset.persisted?.should == false
      end

      it 'returns a falsy value' do
        asset_creation.save.should be_false
      end
    end

    context 'asset is valid' do

      let(:asset_creation) { AssetCreationService.new(asset_attributes) }

      it 'will save' do
        asset_creation.save
        asset_creation.asset.persisted?.should == true
      end 

      it 'will be truthy' do
        asset_creation.save.should be_true
      end

      it 'converts Bundle attributes into Assets attributes' do
        bundle_att = BundleAttribute.create({ bundle_key: "Screen",
                                              bundle_value: "Retina",
                                              bundle_id: bundle.id
                                             })
        asset_creation.save
        asset_feature = asset_creation.asset.asset_features.first

        asset_feature.feature_key.should == bundle_att.bundle_key
        asset_feature.feature_value.should == bundle_att.bundle_value
      end

      context 'asset is trackable' do
        it 'adds serial numbers' do
          asset_creation.save
          asset_creation.asset.serial_numbers.count.should == 1
        end
      end

      context 'asset is non-trackable' do
        it 'does not add serial numbers' do
          asset_creation = AssetCreationService.new(asset_attributes.merge({trackable: false}))
          asset_creation.save
          asset_creation.asset.serial_numbers.count.should == 0
        end 
      end
    end
  end
end