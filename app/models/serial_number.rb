class SerialNumber < ActiveRecord::Base
  belongs_to :item
  belongs_to :user
  attr_accessible :number, :warranty_end

  validates :number, :presence => true, 
                     :uniqueness => true

end
