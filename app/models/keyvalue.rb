class Keyvalue < ActiveRecord::Base
	has_many :keybrands
	has_many :brands, through: :keybrands
end
