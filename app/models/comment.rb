class Comment < ActiveRecord::Base
  attr_accessible :body, :product_id
  validates :user, presence: true
  
  belongs_to :product
end
