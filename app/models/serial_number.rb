class SerialNumber < ActiveRecord::Base
  attr_accessible :number, :warranty_end, :item_id, :user_id, :trackable, :checkout_id

  belongs_to :item
  belongs_to :user
  belongs_to :checkout

  validates :number, :presence => true

end
