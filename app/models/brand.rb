class Brand < ActiveRecord::Base
	has_many :brandstores
	has_many :stores, through: :brandstores
	has_many :keybrands
	has_many :keyvalues, through: :keybrands
end
