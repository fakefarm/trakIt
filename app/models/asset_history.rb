class AssetHistory < ActiveRecord::Base
  attr_accessible :comments, :serial_number_id

  belongs_to :serial_number

  validates :serial_number_id, presence: true
end
