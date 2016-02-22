class Keybrand < ActiveRecord::Base
  belongs_to :brand
  belongs_to :keyvalue
end
