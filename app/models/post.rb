class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :content, presence: true
  validates :cover, presence: true


	attr_accessor :cover_cache

  mount_uploader :cover, CoverUploader

end
