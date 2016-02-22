class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.text :description
      t.string :website
      t.string :instagram

      t.timestamps null: false
    end
  end
end
