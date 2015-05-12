json.paging do
  json.current_page @orders.current_page
  # json.total_pages @orders.total_pages
  # json.per_page @orders.limit_value
  json.next_url (@orders.last_page?)? nil : v1_orders_url( :page => @orders.next_page )
  json.previous_url (@orders.first_page?)? nil : v1_orders_url( :page => @orders.prev_page )
end
json.today_orders @orders do |order|
json.menu_id order.menu_id
json.name order.order_name
json.phone order.order_phone
json.address order.order_address
json.count order.menu_count
json.price order.total_price
end