class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.date :date
      t.string :description
      t.text :content
      t.string :cover

      t.timestamps null: false
    end
  end
end
