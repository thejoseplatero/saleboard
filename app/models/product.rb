class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :image, :address, :latitude, :longitude
  validates :description, :name, :price, presence: true
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  #validates :user, presence: true

  has_many :comments
  belongs_to :user

  has_attached_file :image, 
  :styles => {
    :thumb => "100x100#",
    :small => "150x150>",
    :medium => "200x200>" }
    
end
