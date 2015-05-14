class AddAddressAreaColumnForOrder < ActiveRecord::Migration
  def change
    add_column :orders, :road, :string
    add_column :orders, :area, :string

    remove_column :menus, :road
    remove_column :menus, :area
  end
end
