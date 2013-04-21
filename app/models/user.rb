class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible  :email, :password, :password_confirmation, :remember_me, :image, :image_url, 
  :address, :longitude, :latitude
  # attr_accessible :title, :body

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  has_many :comments
  has_many :products

  has_attached_file :image

  

  def display_name
    if provider=='twitter'
      name 
    else
      " #{email}"
    end
  end

  def email_required?
    uid.blank?
  end

  def password_required?
    uid.blank?
  end
end
