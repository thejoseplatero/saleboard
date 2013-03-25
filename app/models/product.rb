class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :image, :image_file_name
  validates :description, :name, :price, presence: true
  #validates :user, presence: true

  has_many :comments
  belongs_to :user

  has_attached_file :image

end
