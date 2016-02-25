class AddImagesToStores < ActiveRecord::Migration
  def change
    add_column :stores, :images, :json
  end
end
