class Comment < ActiveRecord::Base
  attr_accessible :notes

  belongs_to :commentable, polymorphic: true
end
