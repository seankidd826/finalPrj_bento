class AddDefaultValueToStorageValue < ActiveRecord::Migration
  def change
    change_column_default :users, :storage_money, "0"
  end
end
