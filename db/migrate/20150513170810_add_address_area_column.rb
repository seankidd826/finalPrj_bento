class AddAddressAreaColumn < ActiveRecord::Migration
  def change
    add_column :menus, :road, :string
    add_column :menus, :area, :string
  end
end
