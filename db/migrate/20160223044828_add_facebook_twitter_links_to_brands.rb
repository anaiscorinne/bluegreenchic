class AddFacebookTwitterLinksToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :facebook, :string
    add_column :brands, :twitter, :string
  end
end
