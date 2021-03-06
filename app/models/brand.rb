class Brand < ActiveRecord::Base
  acts_as_votable
  
	has_many :brandstores, dependent: :destroy
	has_many :stores, through: :brandstores
	has_many :keybrands, dependent: :destroy
	has_many :keyvalues, through: :keybrands
  
  accepts_nested_attributes_for :brandstores
	
  validates :name, presence: true
  validates :description, presence: true
  validates :website, presence: true
  validates :instagram, presence: true
  # validates :image, presence: true

  attr_accessor :image_cache

  mount_uploader :image, BrandImageUploader

end
