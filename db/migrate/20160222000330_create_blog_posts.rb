class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.date :date
      t.text :description
      t.text :content

      t.timestamps null: false
    end
  end
end
