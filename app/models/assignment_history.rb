class AssignmentHistory < ActiveRecord::Base
  attr_accessible :checkout_id, :note

  belongs_to :checkout

  validates :checkout_id, presence: true
  validates :note, presence: true
end
