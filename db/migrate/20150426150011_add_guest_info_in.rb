class AddGuestInfoIn < ActiveRecord::Migration
  def change
  add_column  :orders, :order_name, :string
  add_column  :orders, :order_phone, :string
  add_column  :orders, :order_address, :text
  add_column  :orders, :order_email, :string
  end
end
