class AddFromPhoneColumn < ActiveRecord::Migration
  def change
    add_column :orders, :from_phone, :string
  end
end
