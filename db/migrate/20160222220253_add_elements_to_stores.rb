class AddElementsToStores < ActiveRecord::Migration
  def change
    add_column :stores, :ig_url, :string
    add_column :stores, :desc_preview, :string
    add_column :stores, :phone, :string
  end
end
