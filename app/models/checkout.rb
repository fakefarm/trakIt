class Checkout < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  attr_accessible :name, :quantity, :status

  after_save :reduce_quantity

protected

  def reduce_quantity
  end
end
