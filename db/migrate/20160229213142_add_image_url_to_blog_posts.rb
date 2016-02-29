class AddImageUrlToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :post_image, :string
  end
end
