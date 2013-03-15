class Product < ActiveRecord::Base
  attr_accessible :description, :name
  validates :description, :name, presence: true
  #validates :user, presence: true

  has_many :comments
  belongs_to :user
end
