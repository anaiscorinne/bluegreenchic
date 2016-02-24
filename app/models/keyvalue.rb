class Keyvalue < ActiveRecord::Base
	has_many :keybrands
	has_many :brands, -> {distinct}, through: :keybrands

  validates :name, presence: true
  validates :description, presence: true
end
