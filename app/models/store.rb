class Store < ActiveRecord::Base
	has_many :brandstores, dependent: :destroy
	has_many :brands, through: :brandstores

	validates :name, presence: true
  validates :website, presence: true
  validates :instagram, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :ig_url, presence: true
  validates :desc_preview, presence: true
  validates :phone, presence: true
  validates :ig_url_two, presence: true
  validates :ig_url_three, presence: true
  validates :ig_url_four, presence: true
  validates :ig_url_one, presence: true
  validates :images, presence: true


  attr_accessor :images_cache

  mount_uploaders :images, StoreUploader

  acts_as_mappable
  before_validation :geocode_address, :on => :create

  private
  def geocode_address
  	p Geokit::Geocoders.ssl_verify_mode
    geo=Geokit::Geocoders::MultiGeocoder.geocode(address)
    errors.add(:address, "Could not Geocode address") if !geo.success
    self.lat, self.lng = geo.lat,geo.lng if geo.success
  end

end
