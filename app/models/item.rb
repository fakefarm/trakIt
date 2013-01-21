class Item < ActiveRecord::Base
  attr_accessible :name, :quantity, :trackable

  belongs_to :bundle
  has_many :tags
  has_many :checkouts
  has_many :users, through: :checkouts
  has_many :serial_numbers

  validates :quantity, :presence => true

  after_save :add_serial_number

end
