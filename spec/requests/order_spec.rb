require 'rails_helper'

RSpec.describe "API_V1::Orders", :type => :request do

  before do
    @menu = Menu.create!( :title => "Foo", :contents => "肉絲炒蛋呱瓜瓜瓜殺殺殺殺幾嘰嘰唧唧唧水果",
                        :price => 123, :in_stock_qty => 10, :mominfo => "台北 李媽媽" )
    @menu.reload
  end

  example "POST /api/v1/orders" do
    data = {
      :menu_id => @menu.id,
      :menu_count => 5,
      :name => "john",
      :email => "john@gmail.com",
      :phone => "12345",
      :address => "67890"
    }

    post "/api/v1/orders", data

    order = Order.last

    expect(response).to have_http_status(200)
    expect(response.body).to eq(
      {
        :message => "OK",
        :order_id => order.id
      }.to_json
    )

    expect(order.menu_id).to eq( @menu.id )
    expect(order.menu_count).to eq( 5 )
    expect(order.order_name).to eq( "john" )
    expect(order.order_email).to eq( "john@gmail.com" )
    expect(order.order_phone).to eq( "12345" )
    expect(order.order_address).to eq( "67890" )
  end

  example "POST /api/v1/orders (failed)" do
    post "/api/v1/orders", {}

    expect(response).to have_http_status(400)
    expect(response.body).to eq(
      { "errors":
        ["Order phone can't be blank",
         "Menu can't be blank",
         "Menu count can't be blank",
         "Menu count is not a number"
        ]
      }.to_json
    )

    expect( Order.count ).to eq(0)
  end


end
