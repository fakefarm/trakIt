class Tag < ActiveRecord::Base
  attr_accessible :input, :label
  
  belongs_to :item
  belongs_to :bundle
end
