json.id @menu.id
json.url v1_menu_url(@menu)
json.img_url asset_url(@menu.mompic)
json.title @menu.title
json.contents split_menu_content(@menu.contents)
# json.address @menu.address_area
json.price @menu.price
json.in_stock_qty @menu.in_stock_qty
json.mominfo [@menu.mominfo[0..2],@menu.mominfo[4..6]]
json.menu_area %w[大安區 信義區 松山區]
json.created_at @menu.created_at
json.updated_at @menu.updated_at