class Checkout < ActiveRecord::Base
  attr_accessible :name, :quantity, :status, :user_id, :item_id, 
                  :checkout_serial, :due_date
  
  belongs_to :user
  belongs_to :item
  has_many :comments, as: :commentable
  has_many :serial_numbers
  has_many :assignment_histories

  after_save :reduce_quantity

  validates :quantity, :presence => true


protected

  def reduce_quantity
    updated_quantity = self.item.quantity - self.quantity

    self.item.update_attributes( quantity: updated_quantity )

  end
end
