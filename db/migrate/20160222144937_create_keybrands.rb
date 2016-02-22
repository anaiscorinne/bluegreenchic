class CreateKeybrands < ActiveRecord::Migration
  def change
    create_table :keybrands do |t|
      t.references :brand, index: true, foreign_key: true
      t.references :keyvalue, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
