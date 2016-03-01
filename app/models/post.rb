class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :description, presence: true
  validates :content, presence: true
  validates :cover, presence: true


	attr_accessor :cover_cache

  mount_uploader :cover, CoverUploader

end
