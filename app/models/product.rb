class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :image
  validates :description, :name, :price, presence: true
  #validates :user, presence: true

  has_many :comments
  belongs_to :user

  has_attached_file :image,
  :styles => {
    :thumb => "100x100#",
    :small => "150x150>",
    :medium => "200x200>" }
    
end
