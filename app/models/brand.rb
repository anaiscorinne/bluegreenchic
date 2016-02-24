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
 
#   filterrific(
#     default_settings: { sorted_by: 'created_at_desc' },
#     filter_names: [
#       :sorted_by,
#       :search_query,
#       :with_keyvalues
#     ]
#   )

#   scope :with_keyvalues, lambda {
#   wherewhere(
#     'EXISTS (SELECT 1 from comments WHERE keyvalues.id = brand.keyvalues_id)'
#   )
#   }

#   scope :search_query, lambda { |query|
#     return nil  if query.blank?
#   }

#   scope :sorted_by, lambda { |sort_option|
#     direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
#     case sort_option.to_s
#     when /^created_at_/
#       order("students.created_at #{ direction }")
#     when /^name_/
#     # Simple sort on the name colums
#       order("LOWER(students.last_name) #{ direction }, LOWER(students.first_name) #{ direction }")
#     when /^country_name_/
#     # This sorts by a student's country name, so we need to include
#     # the country. We can't use JOIN since not all students might have
#     # a country.
#       order("LOWER(countries.name) #{ direction }").includes(:country)
#     else
#       raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
#   end
# }



end
