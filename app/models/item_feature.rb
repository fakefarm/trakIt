class ItemFeature < ActiveRecord::Base
  attr_accessible :feature_key, :feature_value, :item_id

  belongs_to :item
end
