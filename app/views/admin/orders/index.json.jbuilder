json.array!(@admin_orders) do |admin_order|
  json.extract! admin_order, :id, :total_price, :menu_count, :order_name, :order_phone, :order_address, :order_email
  json.url admin_order_url(admin_order, format: :json)
end
