class BlogPost < ActiveRecord::Base

	validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :content, presence: true
  validates :image, presence: true

  attr_accessor :image_cache

  mount_uploaders :image, BlogpostUploader

end
