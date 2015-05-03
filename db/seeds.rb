# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
:data=>{:confirm=>"確定要刪除?"}
AJAX
不用多一個 controller，放到 OrdersController 就好了

ihower [9:12 PM]
resources :orders do
 post :confirm, :on => :collection
end

ihower [9:12 PM]
:url => confirm_orders_path
1. 填表單 new action

<%= form_for @order %>

  <%= f.text_field :nanem

  <%= f.submit

2. 確認頁 confirm action
  def
    @order = Order.new( order_params)
  end

<%= form_for @order %>

  <%= @order.name
  <%= f.hidden_field :name %>

  <%= f.submit


3. create action