class Store < ActiveRecord::Base
	has_many :brandstores
	has_many :brands, through: :brandstores
end
