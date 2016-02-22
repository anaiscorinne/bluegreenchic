class Brand < ActiveRecord::Base
	has_many :brandstores
	has_many :stores, through: :brandstores
	has_many :keybrands
	has_many :keyvalues, through: :keybrands

	validates :name, presence: true
  validates :description, presence: true
  validates :website, presence: true
  validates :instagram, presence: true

end
