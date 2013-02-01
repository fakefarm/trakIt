class BundleAttribute < ActiveRecord::Base
  attr_accessible :bundle_id, :bundle_key, :bundle_value

  belongs_to :bundle
  
end
