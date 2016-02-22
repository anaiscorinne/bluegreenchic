class CreateKeyvalues < ActiveRecord::Migration
  def change
    create_table :keyvalues do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
