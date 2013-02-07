class Checkout < ActiveRecord::Base
  attr_accessible :name, :quantity, :status, :user_id, :item_id, 
                  :checkout_serial, :due_date
  
  belongs_to :user
  belongs_to :item
  has_many :serial_numbers
  has_many :assignment_histories

  validates :quantity, presence: true
end
