class Tag < ActiveRecord::Base
  attr_accessible :input, :label, :item_id, :bundle_id
  
  belongs_to :tagable, polymorphic: true
end
