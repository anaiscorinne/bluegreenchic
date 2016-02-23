class AddInstaUrlToStores < ActiveRecord::Migration
  def change
    add_column :stores, :ig_url_two, :string
    add_column :stores, :ig_url_three, :string
    add_column :stores, :ig_url_four, :string
  end
end
