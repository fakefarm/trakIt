class Checkout < ActiveRecord::Base
  attr_accessible :name, :quantity, :status
  
  belongs_to :user
  belongs_to :item
  has_many :comments

  after_save :reduce_quantity

  validates :quantity, :presence => true


protected

  def reduce_quantity
  end
end
