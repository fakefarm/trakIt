class Bundle < ActiveRecord::Base
  attr_accessible :name

  has_many :assets
  has_many :comments, as: :commentable
  has_many :bundle_attributes
end
