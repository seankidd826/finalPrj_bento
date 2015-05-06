json.array!(@admin_menus) do |admin_menu|
  json.extract! admin_menu, :id, :title, :contents, :price, :likes_count, :in_stock_qty, :mominfo
  json.url admin_menu_url(admin_menu, format: :json)
end
