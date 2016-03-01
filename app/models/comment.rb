class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :title, presence: true
  validates :body, presence: true
  
end
