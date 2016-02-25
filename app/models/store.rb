class Store < ActiveRecord::Base
	has_many :brandstores
	has_many :brands, through: :brandstores

	validates :name, presence: true
  validates :website, presence: true
  validates :instagram, presence: true
  validates :description, presence: true
  validates :address, presence: true

  attr_accessor :images_cache

  mount_uploaders :images, StoreUploader

end
