class Brand < ActiveRecord::Base
	has_many :brandstores
	has_many :stores, through: :brandstores
	has_many :keybrands
	has_many :keyvalues, through: :keybrands
  
  accepts_nested_attributes_for :brandstores
	
  validates :name, presence: true
  validates :description, presence: true
  validates :website, presence: true
  validates :instagram, presence: true
  validates :image, presence: true

  attr_accessor :image_cache

  mount_uploader :image, BrandImageUploader
 
end
