class DropTableBlogPosts < ActiveRecord::Migration
  def change
  	drop_table :blog_posts
  end
end
