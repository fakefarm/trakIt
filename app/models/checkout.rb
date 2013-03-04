class Checkout < ActiveRecord::Base
  attr_accessible :name, :quantity, :status, :user_id, :asset_id, 
                  :checkout_serial, :due_date
  
  belongs_to :user
  belongs_to :asset
  has_many :serial_numbers
  has_many :assignment_histories

  validates :quantity, presence: true
end
