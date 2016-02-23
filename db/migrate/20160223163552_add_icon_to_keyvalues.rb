class AddIconToKeyvalues < ActiveRecord::Migration
  def change
    add_column :keyvalues, :icon, :string
  end
end
