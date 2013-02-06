class Item < ActiveRecord::Base
  
  attr_accessible :name, :quantity, :trackable, :bundle_id

  belongs_to :bundle
  has_many :checkouts, dependent: :destroy
  has_many :users, through: :checkouts
  has_many :serial_numbers, dependent: :destroy
  has_many :item_features

  validates :quantity, presence: true

end
