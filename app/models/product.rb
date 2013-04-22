  class Product < ActiveRecord::Base
  attr_accessible :description, :price, :image, :address, :latitude, :longitude
  validates :description, :price, presence: true
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  #validates :user, presence: true

  has_many :comments
  belongs_to :user

  has_attached_file :image, 
  :styles => {
    :thumb => "100x100#",
    :small => "140x140>",
    :medium => "200x200>" }
    
end
