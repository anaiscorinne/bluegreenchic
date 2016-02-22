class CreateBrandstores < ActiveRecord::Migration
  def change
    create_table :brandstores do |t|
      t.references :store, index: true, foreign_key: true
      t.references :brand, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
