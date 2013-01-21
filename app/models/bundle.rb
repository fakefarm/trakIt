class Bundle < ActiveRecord::Base
  attr_accessible :input, :label

  has_many :items
end
