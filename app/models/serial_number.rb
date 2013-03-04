class SerialNumber < ActiveRecord::Base
  attr_accessible :number, :warranty_end, :asset_id, :user_id, :checkout_id

  belongs_to :asset
  belongs_to :user
  belongs_to :checkout
  has_many :item_histories
  
  validates :number, presence: true

end
