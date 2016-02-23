class AddFirstInstaUrlToStores < ActiveRecord::Migration
  def change
    add_column :stores, :ig_url_one, :string
  end
end
