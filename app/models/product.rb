class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price
  validates :description, :name, :price, presence: true
  #validates :user, presence: true

  has_many :comments
  belongs_to :user
end
