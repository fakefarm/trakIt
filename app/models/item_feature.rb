class AssetFeature < ActiveRecord::Base
  attr_accessible :feature_key, :feature_value, :asset_id

  belongs_to :asset
end
