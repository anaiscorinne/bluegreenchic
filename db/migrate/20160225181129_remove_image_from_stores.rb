class RemoveImageFromStores < ActiveRecord::Migration
  def change
    remove_column :stores, :image, :string
  end
end
