class Bundle < ActiveRecord::Base
  attr_accessible :name

  has_many :items
  has_many :tags, as: :tagable, dependent: :destroy
end
