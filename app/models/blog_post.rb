class BlogPost < ActiveRecord::Base

	validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :content, presence: true

end
