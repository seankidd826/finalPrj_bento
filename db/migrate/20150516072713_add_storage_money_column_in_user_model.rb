class AddStorageMoneyColumnInUserModel < ActiveRecord::Migration
  def change
    add_column :users, :storage_money, :decimal
  end
end
