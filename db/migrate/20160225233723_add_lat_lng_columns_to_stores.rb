class AddLatLngColumnsToStores < ActiveRecord::Migration
  def change
    add_column :stores, :lat, :decimal
    add_column :stores, :lng, :decimal
  end
end
