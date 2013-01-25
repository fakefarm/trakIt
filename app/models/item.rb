class Item < ActiveRecord::Base

  #TODO - change to ASSET
  
  attr_accessible :name, :quantity, :trackable, :bundle_id

  belongs_to :bundle
  has_many :comments, as: :commentable
  has_many :checkouts, dependent: :destroy
  has_many :users, through: :checkouts
  has_many :serial_numbers, dependent: :destroy

  validates :quantity, :presence => true

  after_create :add_serial_numbers

protected

def add_serial_numbers
    if self.trackable?
      
      # Made a "(none)" user to default to so that editing Serial Numbers doesn't auto select a user.
      not_a_user = 2

      1.upto self.quantity do 
        x = SerialNumber.new({ number: "Enter Serial Numbers", item_id: self.id, user_id: not_a_user })
        x.save
      end
    end
  end
end
