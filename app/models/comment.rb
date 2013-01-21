class Comment < ActiveRecord::Base
  belongs_to :checkout
  attr_accessible :notes
end
